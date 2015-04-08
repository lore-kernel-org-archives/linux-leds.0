From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v4 06/12] of: Add Skyworks Solutions, Inc. vendor prefix
Date: Wed, 8 Apr 2015 14:59:26 +0300
Message-ID: <20150408115926.GV20756@valkosipuli.retiisi.org.uk>
References: <1427809965-25540-1-git-send-email-j.anaszewski@samsung.com>
 <1427809965-25540-7-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1427809965-25540-7-git-send-email-j.anaszewski@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-media@vger.kernel.org, kyungmin.park@samsung.com, pavel@ucw.cz, cooloney@gmail.com, rpurdie@rpsys.net, s.nawrocki@samsung.com, devicetree@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Tue, Mar 31, 2015 at 03:52:42PM +0200, Jacek Anaszewski wrote:
> Use "skyworks" as the vendor prefix for the Skyworks Solutions, Inc.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: devicetree@vger.kernel.org
> ---
>  .../devicetree/bindings/vendor-prefixes.txt        |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 42b3dab..4cd18bb 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -163,6 +163,7 @@ ricoh	Ricoh Co. Ltd.
>  rockchip	Fuzhou Rockchip Electronics Co., Ltd
>  samsung	Samsung Semiconductor
>  sandisk	Sandisk Corporation
> +skyworks	Skyworks Solutions, Inc.

Please maintain the alphabetic order. With that fixed,

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

>  sbs	Smart Battery System
>  schindler	Schindler
>  seagate	Seagate Technology PLC

-- 
Regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
