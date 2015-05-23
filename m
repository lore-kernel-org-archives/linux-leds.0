From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v8 8/8] DT: samsung-fimc: Add examples for
 samsung,flash-led property
Date: Sat, 23 May 2015 15:03:48 +0300
Message-ID: <20150523120348.GA3170@valkosipuli.retiisi.org.uk>
References: <1432131015-22397-1-git-send-email-j.anaszewski@samsung.com>
 <1432131015-22397-9-git-send-email-j.anaszewski@samsung.com>
 <20150520220018.GE8601@valkosipuli.retiisi.org.uk>
 <555DA119.9030904@samsung.com>
 <20150521113213.GI8601@valkosipuli.retiisi.org.uk>
 <555DDD88.8080601@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-media-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <555DDD88.8080601@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-media@vger.kernel.org, kyungmin.park@samsung.com, pavel@ucw.cz, cooloney@gmail.com, rpurdie@rpsys.net, devicetree@vger.kernel.org, sre@kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Sylwester and Jacek,

On Thu, May 21, 2015 at 03:28:40PM +0200, Sylwester Nawrocki wrote:
> flash-leds = <&flash_xx &image_sensor_x>, <...>;

One more matter to consider: xenon flash devices.

How about samsung,camera-flashes (and ti,camera-flashes)? After pondering
this awhile, I'm ok with removing the vendor prefix as well.

Let me know what you think.

-- 
Kind regards,

Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
