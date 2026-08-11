--===================================
--HOTEL MANAGEMENT SYSTEM
--Tables Creation
--===================================
CREATE TABLE hotel (
    hotel_id      NUMBER PRIMARY KEY,
    hotel_name    VARCHAR2(25),
    hotel_address VARCHAR2(25),
    hotel_phone   VARCHAR2(25)
);

CREATE TABLE room (
    room_id       NUMBER PRIMARY KEY,
    hotel_id      NUMBER,
    room_price    NUMBER,
    room_size     VARCHAR2(25),
    room_capacity NUMBER,
    CONSTRAINT room_fk FOREIGN KEY ( hotel_id )
        REFERENCES hotel ( hotel_id ),
    CONSTRAINT room_size_ck
        CHECK ( room_size IN ( 'small', 'medium', 'large' ) )
);

CREATE TABLE guest (
    guest_id    NUMBER PRIMARY KEY,
    guest_name  VARCHAR2(25),
    guest_phone VARCHAR2(25),
    guest_email VARCHAR2(25)
);

CREATE TABLE room_reservation (
    room_id         NUMBER,
    guest_id        NUMBER,
    booking_id      NUMBER,
    booking_invoice NUMBER,
    CONSTRAINT reserv_pk PRIMARY KEY ( room_id,
                                       guest_id ),
    FOREIGN KEY ( room_id )
        REFERENCES room ( room_id ),
    FOREIGN KEY ( guest_id )
        REFERENCES guest ( guest_id )
);

CREATE TABLE event (
    event_id   NUMBER PRIMARY KEY,
    event_name VARCHAR2(25)
);

CREATE TABLE event_in_hotel (
    event_id      NUMBER,
    guest_id      NUMBER,
    reserv_id     NUMBER,
    start_date    DATE,
    end_date      DATE,
    event_invoice NUMBER,
    CONSTRAINT event_in_hotel_pk PRIMARY KEY ( event_id,
                                               guest_id )
);

CREATE TABLE room_registry (
    room_id           NUMBER,
    hotel_id          NUMBER,
    registry_date     DATE,
    room_availability VARCHAR2(25),
    CONSTRAINT room_registry_pk PRIMARY KEY ( room_id,
                                              registry_date ),
    CONSTRAINT room_registry_availability_ck CHECK ( room_availability IN ( 'available', 'blooked' ) )
);

SELECT * FROM hotel;
SELECT * FROM room;
SELECT * FROM guest;
SELECT * FROM event;
SELECT * FROM room_reservation;
SELECT * FROM event_in_hotel;
SELECT * FROM room_registry;	