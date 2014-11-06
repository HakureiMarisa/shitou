<?php
function show_menu($data, $select, $yii){
  echo "<ul>";
  foreach((array)$data as $row){
    $self =  $row['s'];
    $se = $select['id'] == $self['id'] ? 'current' : '';
     echo sprintf('<li><a class="%s" href="%s">%s</a>', $se, $yii->createUrl('post/index',array('catalog'=>$self['catalog_name_alias'])), $self['catalog_name']);
     if (isset($row['c'])) {
       show_menu($row['c'], $select, $yii);
     }
     echo "</li>";
  }
  echo '</ul>';
}
?>
<div class="sidebar" id="sidebar">
  <div class="mbox sideNav">
    <h2><?php if($catalogTopArr):?><?php echo $catalogTopArr['catalog_name']?><?php else:?>资讯<?php endif?></h2>
   <?php if($catalogChild):?>

      <?php show_menu($catalogChild, $catalogArr, $this)?>

    <?php endif?>
  </div>
  <div class="sideBox mbox">
    <p><?php echo $this->_conf['_telephone_400']?></p>
  </div>
</div>
