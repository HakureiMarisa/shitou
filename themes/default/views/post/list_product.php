<?php $this->renderPartial('/_include/header')?>
<div class="mainWrap">
<div class="topDesc">
  <div class="desc">
    <p style=" margin-top:40px;">致力于提升客户品牌形象、实现客户商业目标!</p>
    <p>Commitment to enhance customer brand image,customer business goals!</p>
  </div>
</div>
<div class="global product clear">
   <?php $this->renderPartial('/_include/sidebar_product' ,array('catalogArr'=>$catalogArr, 'catalogChild'=>$catalogChild))?> 
  <div class="mainBox">
    <div class="loc clear">
      <div class="position"> <span>您的位置：</span> <a href="<?php echo Yii::app()->homeUrl?>">首页</a> 
        <?php if ($catalogTopArr['id'] != $catalogArr['id']):?>
         <em></em> <a href="<?php echo $this->createUrl('index',array('catalog'=>$catalogTopArr['catalog_name_alias'])) ?>"><?php echo $catalogTopArr['catalog_name']?></a>
        <?php endif;?>
          <em></em> <?php echo $catalogArr['catalog_name']?>
          
      </div>
    </div>  
  	<div class="listBox clear">
        <ul>
         <?php foreach((array)$bagecmsDataList as $bagecmsKey=>$bagecmsRow):?>
          <?php 
          $odd = $bagecmsKey % 2 == 0 ? '' : 'odd';
          ?>
          <li class="full cl <?php echo $odd;?>">
            <div class="b_img"><a href="<?php if($bagecmsRow->redirect_url):?><?php echo XUtils::convertHttp($bagecmsRow->redirect_url)?><?php else:?><?php echo $this->createUrl('post/show',array('id'=>$bagecmsRow->id))?><?php endif?>" target="_blank"><img src="<?php echo $this->_baseUrl?>/<?php echo $bagecmsRow->attach_thumb?>" alt="<?php echo $bagecmsRow->title?>" class="tn"></a></div>
            <div class="b_content">
            <a href="<?php echo $this->createUrl('post/show',array('id'=>$bagecmsRow->id))?>" target="_blank" style=""><h2><?php echo $bagecmsRow->title?></h2></a>
            <?php echo $bagecmsRow->intro?>
            </div>
          </li>
          <?php endforeach?>
        </ul>
    </div>
    <?php $this->widget('CLinkPager',array('pages'=>$bagecmsPagebar));?>
  </div> 
</div> 
<?php $this->renderPartial('/_include/footer')?>
