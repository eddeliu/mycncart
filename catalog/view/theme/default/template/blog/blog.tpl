<?php echo $header; ?>
<?php if ($categories) { ?>
<div class="container visible-xs">
  <nav id="menu" class="navbar">
    <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_blog_category ?></span>
      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex2-collapse"><i class="fa fa-bars"></i></button>
    </div>
    <div class="collapse navbar-collapse navbar-ex2-collapse">
      <ul class="nav navbar-nav">
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
        <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
          <div class="dropdown-menu">
            <div class="dropdown-inner">
              <?php foreach ($category['children'] as $children) { ?>
              <ul class="list-unstyled">
                <li><a href="<?php echo $children['href']; ?>"><?php echo $children['name']; ?></a></li>
              </ul>
              <?php } ?>
            </div>
          </div>
        </li>
        <?php } else { ?>
        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <?php } ?>
      </ul>
    </div>
  </nav>
</div>
<?php } ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
    
      <?php if($cms_blog_show_image) { ?>
        <?php if ($thumb) { ?>
        <div><img src="<?php echo $thumb; ?>" alt="<?php echo $title; ?>" title="<?php echo $title; ?>" class="img-thumbnail" /></div>
        <?php } ?>
      <?php } ?>
          
      <h1><?php echo $title; ?></h1>
      
      <div>
		
		  	<?php if( $cms_blog_show_author ) { ?>
			<span><i class="fa fa-pencil"></i> <b><?php echo $text_written_by; ?></b> <?php echo $author; ?></span> 
			<?php } ?>
			
			<?php if( $cms_blog_show_created_date ) { ?>
			<span><i class="fa fa-calendar"></i> <b><?php echo $text_created_date; ?></b> <?php echo $created; ?></span> 
			<?php } ?>
			
			
			<?php if( $cms_blog_show_hits ) { ?>
			<span><i class="fa fa-insert-template"></i> <b><?php echo $text_hits; ?></b> <?php echo $hits; ?> </span>
			<?php } ?>		
			

			
			<?php if( $cms_blog_show_comment_counter ) { ?>
			<span><i class="fa fa-comment"></i> <b><?php echo $text_comment_count; ?></b> <?php echo $comment_count; ?> </span>
			<?php } ?>	
			
		
		  </div>
          
      <?php echo $description; ?>
      
      <?php if ($tags) { ?>
      <p><span class="lead"><?php echo $text_tags; ?></span>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        <?php } else { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>
      </p>
      <?php } ?>
      
      <!-- AddBaidu Share Button BEGIN -->
            <div class="bdsharebuttonbox"><a href="#" class="bds_more" data-cmd="more"></a><a title="分享到QQ空间" href="#" class="bds_qzone" data-cmd="qzone"></a><a title="分享到新浪微博" href="#" class="bds_tsina" data-cmd="tsina"></a><a title="分享到腾讯微博" href="#" class="bds_tqq" data-cmd="tqq"></a><a title="分享到人人网" href="#" class="bds_renren" data-cmd="renren"></a><a title="分享到微信" href="#" class="bds_weixin" data-cmd="weixin"></a><a title="分享到Facebook" href="#" class="bds_fbook" data-cmd="fbook"></a><a title="分享到Twitter" href="#" class="bds_twi" data-cmd="twi"></a><a title="分享到linkedin" href="#" class="bds_linkedin" data-cmd="linkedin"></a></div>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"24"},"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin","fbook","twi","linkedin"],"viewText":"分享到：","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin","fbook","twi","linkedin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
            <!-- AddBaidu Share Button END -->
      <hr>
      
      <?php if ($comment_status) { ?>
        
          <form class="form-horizontal" id="form-comment">
            <div id="comment"></div>
            <h2><?php echo $text_write; ?></h2>
            <?php if ($comment_guest) { ?>
            <div class="form-group required">
              <div class="col-sm-12">
                <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                <input type="text" name="name" value="" id="input-name" class="form-control" />
              </div>
            </div>
            <div class="form-group required">
              <div class="col-sm-12">
                <label class="control-label" for="input-comment"><?php echo $entry_comment; ?></label>
                <textarea name="text" rows="5" id="input-comment" class="form-control"></textarea>
                <div class="help-block"><?php echo $text_note; ?></div>
              </div>
            </div>
            <?php echo $captcha; ?>
            <div class="buttons clearfix">
              <div class="pull-right">
                <button type="button" id="button-comment" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
              </div>
            </div>
            <?php } else { ?>
            <?php echo $text_login; ?>
            <?php } ?>
          </form>
        
      <?php } ?>
      
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
$('#comment').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#comment').fadeOut('slow');

    $('#comment').load(this.href);

    $('#comment').fadeIn('slow');
});

$('#comment').load('index.php?route=blog/blog/comment&blog_id=<?php echo $blog_id; ?>');

$('#button-comment').on('click', function() {
	$.ajax({
		url: 'index.php?route=blog/blog/write&blog_id=<?php echo $blog_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-comment").serialize(),
		beforeSend: function() {
			$('#button-comment').button('loading');
		},
		complete: function() {
			$('#button-comment').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#comment').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#comment').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('#comment').load('index.php?route=blog/blog/comment&blog_id=<?php echo $blog_id; ?>');
			}
		}
	});
});

//--></script>
<?php echo $footer; ?> 