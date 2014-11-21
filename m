From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH] Add attributes neccessary for LED flashes to
 devicetree/bindings/leds/common.txt
Date: Fri, 21 Nov 2014 09:40:38 +0200
Message-ID: <20141121074038.GD8907@valkosipuli.retiisi.org.uk>
References: <20141120131713.GC27527@amd>
 <20141120150349.GZ8907@valkosipuli.retiisi.org.uk>
 <546EEBF9.9080006@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <546EEBF9.9080006@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, linux-leds@vger.kernel.org, linux-doc@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rob@landley.net
List-Id: linux-leds@vger.kernel.org

Hi Jacek,

On Fri, Nov 21, 2014 at 08:38:33AM +0100, Jacek Anaszewski wrote:
> >It might be good to add a note that these may be arrays, depending on the
> >device.
> >
> 
> This binding is for a sub-node representing a single led.
> Do you know devices which would require an array of max currents
> for a sub-led?

Individual LEDs can have different maximum current limits. So if you connect
two LEDs, one may have a higher limit than the other.

-- 
Sakari Ailus
e-mail: sakari.ailus@iki.fi	XMPP: sailus@retiisi.org.uk
