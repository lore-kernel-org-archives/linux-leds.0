From: Anders Darander <anders@chargestorm.se>
Subject: Re: [PATCH v2] leds-pca963x: add bindings to invert polarity
Date: Thu, 27 Apr 2017 08:45:09 +0200
Message-ID: <20170427064509.ev2syo7mpku5pzxi@ad.chargestorm.se>
References: <20170427063733.32323-1-anders@chargestorm.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170427063733.32323-1-anders@chargestorm.se>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: rpurdie@rpsys.net
List-Id: linux-leds@vger.kernel.org

Hi all,

* Anders Darander <anders@chargestorm.se> [170427 08:37]:
> Add a new DT property, nxp,inverted-out, to invert the polarity of the output.
> Tested on PCA9634.

I'm making a 2nd attempt at this. The ability to invert the output from
the PCA9634 is important, and I'd like to avoid out-of-tree patches as
much as possible.

In replies to my previous attempt [1] another attempt at adding this
support was mentioned [2]. However, that attempt seems to have stalled
[3]. Even if the rest of the fixes / improvements from that series
aren't merged, I'd like to see the support for the inverted output.

Cheers,
Anders

[1] https://lkml.org/lkml/2016/5/4/120
[2] https://lkml.org/lkml/2016/4/19/90
[3] https://lkml.org/lkml/2016/9/6/187
