From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v9 1/1] leds: LED driver for TI LP3952 6-Channel Color LED
Date: Sat, 9 Jul 2016 11:08:32 +0300
Message-ID: <20160709080832.GA14693@lahna.fi.intel.com>
References: <1467974244-3161-1-git-send-email-tony.makkiel@daqri.com>
 <CAJZ5v0i0QV3GEXsww5AAer4zkDEW30kd9HOm0QV2xYE0xhc5qQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:6372 "EHLO mga04.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756679AbcGIIIh (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Sat, 9 Jul 2016 04:08:37 -0400
Content-Disposition: inline
In-Reply-To: <CAJZ5v0i0QV3GEXsww5AAer4zkDEW30kd9HOm0QV2xYE0xhc5qQ@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Tony Makkiel <tony.makkiel@daqri.com>, linux-leds@vger.kernel.org, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Jacek Anaszewski <j.anaszewski@samsung.com>, rpurdie@rpsys.net, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>

On Fri, Jul 08, 2016 at 09:28:06PM +0200, Rafael J. Wysocki wrote:
> On Fri, Jul 8, 2016 at 12:37 PM, Tony Makkiel <tony.makkiel@daqri.com> wrote:
> > The chip can drive 2 sets of RGB leds. Controller can
> > be controlled via PWM, I2C and audio synchronisation.
> > This driver uses I2C to communicate with the chip.
> >
> > Datasheet: http://www.ti.com/lit/gpn/lp3952
> >
> > Signed-off-by: Tony Makkiel <tony.makkiel@daqri.com>
> 
> >From the ACPI perspective, I don't see anything objectionable here.
> 
> Mika, do you agree?

Yes, looks fine to me.
