From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [patch] leds: add driver for Mellanox systems leds
Date: Thu, 15 Sep 2016 14:52:22 +0200
Message-ID: <20160915125222.GG13132@amd>
References: <1473255323-191745-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1473255323-191745-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vadimp@mellanox.com
Cc: rpurdie@rpsys.net, j.anaszewski@samsung.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, jiri@resnulli.us, michaelsh@mellanox.com
List-Id: linux-leds@vger.kernel.org

Hi!

> +++ b/MAINTAINERS
> @@ -7655,6 +7655,14 @@ W:	http://www.mellanox.com
>  Q:	http://patchwork.ozlabs.org/project/netdev/list/
>  F:	drivers/net/ethernet/mellanox/mlxsw/
>  
> +MELLANOX MLXCPLD LED DRIVER
> +M:	Vadim Pasternak <vadimp@mellanox.com>
> +L:	linux-leds@vger.kernel.org
> +S:	Supported
> +W:	http://www.mellanox.com

Unless you have web page specificly about the LED hardware, I don't
think W: tag is useful here.

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
