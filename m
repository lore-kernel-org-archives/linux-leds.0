From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/5] leds: core: Drivers shouldn't enforce SYNC/ASYNC
 brightness setting
Date: Fri, 9 Oct 2015 13:16:35 +0200
Message-ID: <20151009111635.GA13923@amd>
References: <1442845770-17800-1-git-send-email-j.anaszewski@samsung.com>
 <1442845770-17800-2-git-send-email-j.anaszewski@samsung.com>
 <20151008155036.GF11776@xo-6d-61-c0.localdomain>
 <56175E9C.5040403@samsung.com>
 <20151009070202.GA27183@amd>
 <561775EC.80703@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:53102 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756019AbbJILQi (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 9 Oct 2015 07:16:38 -0400
Content-Disposition: inline
In-Reply-To: <561775EC.80703@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, andrew@lunn.ch, sakari.ailus@linux.intel.com

On Fri 2015-10-09 10:08:12, Jacek Anaszewski wrote:
> On 10/09/2015 09:02 AM, Pavel Machek wrote:
> >On Fri 2015-10-09 08:28:44, Jacek Anaszewski wrote:
> >>On 10/08/2015 05:50 PM, Pavel Machek wrote:
> >>>On Mon 2015-09-21 16:29:26, Jacek Anaszewski wrote:
> >>>>This patch removes SET_BRIGHTNESS_ASYNC and SET_BRIGHTNESS flags.
> >>
> >>s/SET_BRIGHTNESS/SET_BRIGHTNESS_SYNC/
> >>
> >>>>led_set_brightness now calls led_set_brightness_nosleep instead of
> >>>>choosing between sync and async op basing on the flags defined by the
> >>>>driver.
> >>>
> >>>Are those flags unused in the version of kernel you are patching?
> >>
> >>The flags are used until this patch.
> >
> >Hmm. I seen you removing the definitions, but not removing any
> >users. I guess I missed something.
> 
> Only LED core is the user. It sets SET_BRIGHTNESS_SYNC flag
> for LED flash class drivers.

Aha. All is right, then.

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
