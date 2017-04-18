select * from invoice join invoiceline
	on invoice.InvoiceId = invoiceline.InvoiceId
	where invoiceline.InvoiceId > 0.99;

select InvoiceDate, FirstName, LastName, Total from invoice join customer
	on invoice.CustomerId = customer.CustomerId;

select employee.FirstName, employee.LastName, customer.FirstName, customer.LastName from employee join customer
	on employee.EmployeeId = customer.SupportRepId;

select album.Title, artist.Name from album join artist
	on album.ArtistId = artist.ArtistId;

Select playlist.name, track.name from playlist
	join playlisttrack on playlist.playlistId = playlisttrack.playlistId
  join track on playlisttrack.trackId = track.TrackId
  where playlist.name = 'Music';

Select playlisttrack.playlistId, track.name from playlisttrack
  join track on playlisttrack.trackId = track.TrackId
  where playlisttrack.playlistId = 5;

Select playlist.name, track.name from playlist
  join playlisttrack on playlist.playlistId = playlisttrack.playlistId
  join track on playlisttrack.trackId = track.TrackId
  order by playlist.name;

select genre.name as genre, track.name, album.title from track
	join genre on track.genreId = genre.genreId
  join album on album.albumId = track.albumId
  where genre = 'Alternative';

select playlist.name as Playlist, track.name, genre.name as Genre, album.title, artist.name as Artist  from playlist
	join playlisttrack on playlist.playlistId = playlisttrack.playlistId
  join track on playlisttrack.trackId = track.trackId
  join genre on track.genreId = genre.genreId
  join album on track.albumId = album.albumId
  join artist on album.artistId = artist.artistId
  where playlist.name = 'Music';

select * from invoice where invoiceId
  in (select invoiceId from invoiceLine where unitPrice > 0.99);

select * from playlistTrack where playlistId
 in (select playlistId from playlist where name = 'Music');

select track.name from track where trackId
  in (select trackId from playlistTrack where playlistId = 5);

select * from track where genreId
 in (select genreId from genre where name = 'Comedy');

select * from track where albumId
  in (select albumId from album where title = 'Fireball');

select * from track where albumId
	in (select albumId from album where artistID
    	in (select artistId from artist where name = 'Queen'));


Update customer set fax = null where not fax isnull;
Update customer set company = 'self' where company isnull;
Update customer set LastName = 'Thompson'
  where FirstName = 'Julia' and LastName = 'Barnett';
Update customer set supportRepId = 4
  where email = 'luisrojas@yahoo.cl';
Update track set composer = 'The Darkness Around Us'
	where composer isNull and genreId in (select genreId from genre where name = 'Metal');


select genre.name as Genre, count(track.name) as NumTracks from track
	join genre on track.genreId = genre.genreId
    Group by Genre;

select genre.name as Genre, count(track.name) as NumTracks from track
	join genre on track.genreId = genre.genreId
    Where Genre = 'Pop';

select artist.name as Artist, count(album.albumId) as NumAlbums from artist
	join album on artist.artistId = album.artistId
    group by Artist;

select distinct composer from track order by composer;
select distinct billingpostalcode from invoice;
select distinct company from customer;
