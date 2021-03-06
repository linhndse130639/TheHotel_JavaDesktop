/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package linhnd.controllers;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import linhnd.daos.BookingDAO;
import linhnd.daos.DetailBookingDAO;
import linhnd.daos.HotelDAO;
import linhnd.daos.KindOfRoomDAO;
import linhnd.daos.RoomInHotelDAO;
import linhnd.dtos.Booking;
import linhnd.dtos.Hotel;
import linhnd.dtos.KindOfRoom;

/**
 *
 * @author Duc Linh
 */
public class SearchController implements Serializable {
// tìm những khách sạn hợp lệ theo seảch của khách hàng

    public List<Hotel> getListHotelVaild(String textSearch, Date dateFrom, Date dateTo) throws Exception {
        Map<String, String> resultMapIdBookIdHotel = null;
        List<Booking> resultBooking = null;
        List<String> listIdHotelNoVaild = new ArrayList<>();
        List<Hotel> listHotelValid = null;
        try {
            BookingDAO bookingDAO = new BookingDAO();
            HotelDAO hotelDAO = new HotelDAO();
            DetailBookingDAO detailBookingDAO = new DetailBookingDAO();
            RoomInHotelDAO roomInHotelDAO = new RoomInHotelDAO();
            resultBooking = bookingDAO.getListBookingNotValid(dateFrom, dateTo);
            resultMapIdBookIdHotel = hotelDAO.getIdHotelByIdBooking(resultBooking);
            for (Booking booking : resultBooking) {
                String idHotel = resultMapIdBookIdHotel.get(booking.getIdBooking());
                //Đếm số lượng phòng ứng với mỗi booking
                int countRoomBook = detailBookingDAO.countRoomInDetailByIdBooking(booking.getIdBooking());//****
                // đếm số phòng có trong khách sạn
                int countRoomInHotel = roomInHotelDAO.countRoomInHotelByHotelid(idHotel);
                if (countRoomInHotel <= countRoomBook) {
                    //Nếu số lượng phòng trong khách sạn < số lượng phòng booking
                    listIdHotelNoVaild.add(idHotel); // list những khách sạn không thỏa mãn
                }
            }
            listHotelValid = hotelDAO.getlistHotelSearch(listIdHotelNoVaild, textSearch); // lấy những khách sạn thảo mãn bằng Not In
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listHotelValid;
    }
// kiểm tra những khách sạn còn phòng hợp lệ để show những khách sạn đó lên vào lúc bắt đầu

    public List<Hotel> getListHotelVaildNow() throws Exception {
        Map<String, String> resultMapIdBookIdHotel = null;
        List<Booking> resultBooking = null;
        List<String> listIdHotelNoVaild = new ArrayList<>();
        List<Hotel> listHotelValid = null;
        try {
            BookingDAO bookingDAO = new BookingDAO();
            HotelDAO hotelDAO = new HotelDAO();
            DetailBookingDAO detailBookingDAO = new DetailBookingDAO();
            RoomInHotelDAO roomInHotelDAO = new RoomInHotelDAO();
            resultBooking = bookingDAO.getListBookingNow();
            resultMapIdBookIdHotel = hotelDAO.getIdHotelByIdBooking(resultBooking);
            for (Booking booking : resultBooking) {
                String idHotel = resultMapIdBookIdHotel.get(booking.getIdBooking());
                int countRoomBook = detailBookingDAO.countRoomInDetailByIdBooking(booking.getIdBooking());
                int countRoomInHotel = roomInHotelDAO.countRoomInHotelByHotelid(idHotel);
                if (countRoomInHotel <= countRoomBook) {
                    listIdHotelNoVaild.add(idHotel);
                }
            }
            listHotelValid = hotelDAO.getListHotelVaildNow(listIdHotelNoVaild);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listHotelValid;
    }

    // kiểm tra những loại phòng còn để cho khách book ==> View
    public List<KindOfRoom> checkKindOfRoom(Date dateFrom, Date dateTo, String idHotel) throws Exception {
        List<Booking> resultBooking = null;
        List<KindOfRoom> listKindOfRoomlValid = new ArrayList<>();
        List<KindOfRoom> listKindOfRoomlInHotel = null;
        try {
            BookingDAO bookingDAO = new BookingDAO();
            RoomInHotelDAO roomInHotelDAO = new RoomInHotelDAO();
            KindOfRoomDAO kindOfRoomDAO = new KindOfRoomDAO();
            //Lấy List các Booking của idHotel giữa 2 ngày DateFrom và DateTo
            resultBooking = bookingDAO.getListBookingInHotel(dateFrom, dateTo, idHotel);
            // Lấy list các KindOfRoom của Khách sạn check
            listKindOfRoomlInHotel = kindOfRoomDAO.getListKindOfRoom(idHotel);
            for (KindOfRoom kindOfRoom : listKindOfRoomlInHotel) {
                int countKindOfRoomBooking = 0;
                // Đếm số lượng của 1 loại phòng IdKindofRoom
                int countKindOfRoom = roomInHotelDAO.countOfRoomInHotel(kindOfRoom.getIdKindRoom(), idHotel);
                // Tính tổng số phòng đã được booking của 1 kindOFRoom
                for (Booking booking : resultBooking) {
                    countKindOfRoomBooking = countKindOfRoomBooking + roomInHotelDAO.countKindOfRoomBooking(kindOfRoom.getIdKindRoom(), idHotel, booking.getIdBooking());
                }
                if (countKindOfRoom > countKindOfRoomBooking) {
                    //Những loại phòng nào có số lượng phòng trong khách sạn > số lượng loại phòng đó trong booking thì add list
                    listKindOfRoomlValid.add(kindOfRoom); // List loại phòng thỏa mãn
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listKindOfRoomlValid;
    }

    // tính số phòng của 1 loại phòng còn lại thỏa mãn có thể booking đc 
    public int checkNumberKindOfRoom(Date dateFrom, Date dateTo, String idHotel, String idkindOfRoom) throws Exception {
        List<Booking> resultBooking = null;
        int count = 0;
        try {
            BookingDAO bookingDAO = new BookingDAO();
            RoomInHotelDAO roomInHotelDAO = new RoomInHotelDAO();
            //search những booking có giữa 2 ngày From To của 1 khách sạn
            resultBooking = bookingDAO.getListBookingInHotel(dateFrom, dateTo, idHotel);
            int countKindOfRoomBooking = 0;
            int countKindOfRoom = roomInHotelDAO.countOfRoomInHotel(idkindOfRoom, idHotel);
            for (Booking booking : resultBooking) {
                countKindOfRoomBooking = countKindOfRoomBooking + roomInHotelDAO.countKindOfRoomBooking(idkindOfRoom, idHotel, booking.getIdBooking());
            }
            count = countKindOfRoom - countKindOfRoomBooking;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
}
