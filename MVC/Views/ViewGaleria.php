<?php

/**
 * View Galeria
 * @author Elton Fabiano da Mota
 * @copyright Color Pix
 */

class ViewGaleria
{
	/**
	 * this html set text HTML 
	 * for response browser
	 */
	public $html;

	public function getSubmenu(array $data, $IdGaleria)
	{

		$this->html = '<aside id="sidebar">	        		
		        			<div id="cssmenu">
								<ul>';

		foreach ($data as $k => $v) {

			$active = '';

			if (!$v['CHILD']){
				$active = ($IdGaleria == $v['GSM_ID']) ? "active" : "";
				$this->html .= '<li id="'.$v['GSM_ID'].'" class="'.$active.'"><a href="javascript:getGaleria('.$v['GSM_ID'].')">'.$v['GSM_DESC'].'</a></li>';		
			}else{
				$this->html .= '<li id="'.$v['GSM_ID'].'" class="has-sub '.$active.'"><a href="#">'.$v['GSM_DESC'].'</a><ul>';

				foreach ($v['CHILD'] as $sub) {
					$this->html .= '<li><a href="javascript:getGaleria('.$sub['GSM_ID'].')">'.$sub['GSM_DESC'].'</a></li>';
				}

				$this->html .= '</li></ul>';		
			}
		}

				$this->html .= '</ul>
		        			</div>	        	
		        		</aside>';
		return $this->html;
	}

	public function getGaleria(array $data)
	{
		$this->html = '<div id="posts-list">
						<div id="gallery" class="gallery-grid">
							<div class="abt-para">
								<ul class="pgwSlideshow">';

				foreach ($data as $k => $v) {

					$this->html .= '<li><img src="img/galerias/'.$v['GIM_DIR'].'/'.$v['GIM_IMAGE'].'.jpg" alt="'.$v['DESC1'].' '.$v['DESC2'].'"></li>';
					
				}

				$this->html .= '</ul>
							<br>
							<a href="downloads/'.$v['GIM_DIR'].'.zip" class="link-button blue alignright">Baixar esta Galeria</a>
							<br><br><br><br>
					  		</div>
					  	</div>
					  </div>';

		return $this->html;
	}

	public function changeGaleria(array $data)
	{
		$this->html = ' <div class="abt-para">
							<ul class="pgwSlideshow">';

			foreach ($data as $k => $v) {

				$this->html .= '<li><img src="img/galerias/'.$v['GIM_DIR'].'/'.$v['GIM_IMAGE'].'.jpg" alt="'.$v['DESC1'].' '.$v['DESC2'].'"></li>';
				
			}

			$this->html .= '</ul>
							<br>
							<a href="downloads/'.$v['GIM_DIR'].'.zip" class="link-button blue alignright">Baixar esta Galeria</a>
							<br><br><br><br>
				  		</div>';

		return $this->html;
	}
}