From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: leds-gpio on x86
Date: Thu, 6 Aug 2015 20:35:58 +0300
Message-ID: <20150806173558.GZ1540@lahna.fi.intel.com>
References: <20150805220948.3984f19c@x2>
 <20150806165924.GY1540@lahna.fi.intel.com>
 <20150806191727.0bf87a3a@x2>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-acpi-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150806191727.0bf87a3a@x2>
Sender: linux-acpi-owner@vger.kernel.org
To: Vincent Pelletier <plr.vincent@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-acpi@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Thu, Aug 06, 2015 at 07:17:27PM +0200, Vincent Pelletier wrote:
> On Thu, 6 Aug 2015 19:59:24 +0300, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > Does it list the GPIO controller itself in the DSDT? If it does not, you
> > would need to patch that there as well.
> 
> I do see this in the dsdt:
>   Name (_HID, "INT33FC" /* Intel Baytrail GPIO Controller */)  // _HID: Hardware ID
>   Name (_CID, "INT33FC" /* Intel Baytrail GPIO Controller */)  // _CID: Compatible ID
> 
> I do not know the distinction between a gpio controller and the chip
> which has the pins directly, though.

Do you know which GPIOs are used for leds?

Since the GPIO host controller is listed in the DSDT, I think patching
the leds device should be pretty simple.

> > Just in case, can you provide me the DSDT? I can take a look.
> 
> (sent off-list)

Got it, thanks.
