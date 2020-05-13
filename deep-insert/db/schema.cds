namespace ns;

entity Students {
    key ID: UUID;
    name: String;
    room: Composition of one Rooms on room.tenant = $self;
    books: Composition of many Books on books.holder = $self;
}

@cds.autoexpose
entity Rooms {
    key ID: UUID;
    address: String;
    roomnumber: Integer;
    tenant: Association to one Students;
}

@cds.autoexpose
entity Books {
    key ID: UUID;
    title: String;
    state: Integer default 1;
    holder: Association to one Students; 

}