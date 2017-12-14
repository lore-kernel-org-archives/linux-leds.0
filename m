From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v2 1/2] leds: as3645a: Fix quoted string split warning
Date: Thu, 14 Dec 2017 20:04:44 +0200
Message-ID: <20171214180443.z5fghwlj2ncfkaan@valkosipuli.retiisi.org.uk>
References: <20171214173727.10070-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171214173727.10070-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz, laurent.pinchart@ideasonboard.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Thu, Dec 14, 2017 at 11:37:26AM -0600, Dan Murphy wrote:
> Fix a warning for a split quoted string across
> lines.
> 
> WARNING: quoted string split across lines
> 459: FILE: drivers/leds/leds-as3645a.c:459:
> 		dev_err(dev, "AS3645A not detected "
> 			"(model %d rfu %d)\n", model, rfu);
> 
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

Thanks!

For both:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
e-mail: sakari.ailus@iki.fi
