<?php
include_once '../html/baiviet.html';
include_once 'connect.php';
$sqlbaiviet = "select * from tbl_taikhoan tk, tbl_baiviet bv where tk.Email = bv.Email;";
if ($result = $link->query($sqlbaiviet)) {
    while($baiviet=$result->fetch_object()){
        $Idbaiviet= $baiviet->Idbaiviet;
        $sqldemsobinhluan ="select count(Idbinhluan) as slbl from tbl_binhluan bl where bl.Idbaiviet = $Idbaiviet ;";
        $sqlbinhluan = "select * from tbl_taikhoan tk, tbl_binhluan bl where bl.Email = tk.Email and bl.Idbaiviet = $Idbaiviet ;";
        $sqlhinhanh = "select * from tbl_hinhanh where Idbaiviet = $Idbaiviet;";
?>  
    <div class="col mt-4">
        <div class="d-flex flex-row justify-content-between">
            <div class="d-flex flex-row ">
                <img src="<?php echo '../'.$baiviet->Hinhdaidien ?>" alt="" style="border-radius: 50%;" height="50px"; width="50px">
                <div class="ml-2">
                    <h3><?php echo $baiviet->Tenhienthi ?></h3>
                    <p><?php echo date("d-m-Y", strtotime($baiviet->Ngaydangbaiviet))." lúc ".date("G:i:s", strtotime($baiviet->Ngaydangbaiviet)) ?> 
                </div>
            </div>
            <div class="d-flex flex-row align-items-center">
                <button class="btn btn-outline-primary">Theo dõi</button>
                <div class="dropdown">
                    <button class="btn btn-outline-secondary" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <ion-icon name="ellipsis-vertical-outline"></ion-icon>
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="#">Chỉnh sửa bài viết</a>
                        <a class="dropdown-item" href="#">Báo cáo bài viết</a>
                    </div>
                </div>
            </div>
        </div>
        <h3><?php echo $baiviet->Tieudebaiviet ?></h3>
        <div div-name="baiviet">
            <p p-name="baiviet" >
                <?php echo $baiviet->Noidung ?>
            </p>
        </div>

        <div class="d-block">
            <button class="btn btn-outline-secondary" btn-name="xemthem" style="display: none;">Xem thêm</button>
            <button class="btn btn-outline-secondary" btn-name="an" style="display: none;">Ẩn</button>
            <p><ion-icon name="location-outline"></ion-icon><?php echo $baiviet->Diachiquan ?></p>
            <p><ion-icon name="time-outline"></ion-icon> <?php echo $baiviet->Thoigianmocua ?></p>
            <p><ion-icon name="cash-outline"></ion-icon>  <?php echo $baiviet->Giaban ?></p>
            <p><ion-icon name="restaurant-outline"></ion-icon>  <?php echo $baiviet->Diemdanhgia."/10" ?></p>
        </div>
            <?php // echo hình ảnh nếu có 
                    $result3 = $link->query($sqlhinhanh);
                    if($link->affected_rows>0){
                        echo "<div class='row   mt-2' div-name='hinhbaiviet'>";
                        while($hinhanh=$result3->fetch_object()){
            ?>
                        <img src="<?php echo"../".$hinhanh->Duongdan ?>" alt="" img-name="hinhbaiviet">
            <?php
                         }
                        echo"</div>";
                    } 
            ?>
        
        <hr>
        <div class="d-flex flex-row justify-content-between">
            <div>
                <ion-icon name="eye-outline"></ion-icon> <?php echo $baiviet->Soluotxem ?>
                <?php // echo số bình luận
                    $result2 = $link->query($sqldemsobinhluan);
                    while($soluong=$result2->fetch_object()){
                ?> 
                <ion-icon name="chatbox-ellipses-outline"></ion-icon> <?php echo $soluong->slbl;} $result2->close(); ?>
            </div>
            <div>
                <button class="btn btn-outline-secondary"><ion-icon name="heart-outline" size="large"></ion-icon></button>
                <button class="btn btn-outline-secondary"><ion-icon name="share-outline" size="large"></ion-icon></button>
            </div>
        </div>
        <hr>
        <form>
            <div class="form-group">
                <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Bình luận">
            </div>
        </form>
        <?php // echo nội dung bình luận

        $result1 = $link->query($sqlbinhluan);
        while($binhluan=$result1->fetch_object()){   ?>
            <div class="d-flex flex-row  mt-2">
                <img src="<?php echo '../'.$baiviet->Hinhdaidien ?>" alt=""style="border-radius: 50%;"; height="70px"; width="70px">
                <div class="d-flex flex-column justify-content-center pl-2" div-name="binhluan">
                    <p p-name="binhluan">
                        <?php  echo $binhluan->Noidung ?>
                    </p>
                    <div class="d-block">
                        <button class="btn btn-outline-secondary" btn-name="xemthem-binhluan" style="display: none;">Xem thêm</button>
                        <button class="btn btn-outline-secondary" btn-name="an-binhluan" style="display: none;" >Ẩn</button>
                    </div>
                </div>
            </div>;          
        <?php 
        }$result1->close();

        ?>
    </div>
    
<?php
         
    }$result->close();
}
mysqli_close($link);
?>
