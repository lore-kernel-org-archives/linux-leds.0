From: Marek Behun <marek.behun@nic.cz>
Subject: Re: [RFC PATCH 3/5] documention: leds: Add multicolor class
 documentation
Date: Tue, 2 Apr 2019 17:56:23 +0200
Message-ID: <20190402175623.0d85ad7d@nic.cz>
References: <20190401173400.14238-1-dmurphy@ti.com>
        <20190401173400.14238-4-dmurphy@ti.com>
        <20190401212709.GA14681@amd>
        <e2621a54-4c5c-4235-9aba-39a856cfbe88@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e2621a54-4c5c-4235-9aba-39a856cfbe88@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: Pavel Machek <pavel@ucw.cz>, robh+dt@kernel.org, jacek.anaszewski@gmail.com, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi

On Tue, 2 Apr 2019 06:53:30 -0500
Dan Murphy <dmurphy@ti.com> wrote:

> I agree there are other solutions.  Better not so sure.
> We keep kicking a solution down the road we have been talking about adding something to the kernel
> for almost 5 months now, but no one can decide what to do.
> 
> How do we move a solution forward?
> Should we just forget the whole idea and keep developing against the current framework?
> 
> > One was discussed before -- have single file which contains
> > coefficients for r/g/b channels.
> >   
> 
> That has been presented as well and the concept was not well received either.
> 
> > Or at least... you should not really need separate sync and
> > sync_enable files. One should do.
> >   
> 
> The idea here was to be able to set the LED brightness immediately on a single LED
> with a single brightness write or setup the color brightness on all the LEDs and then
> sync the LED brightnesses.
> 
> If you wanted to control a single LED for notifications the user space may have to do
> 
> echo 0 > blue/brightness
> echo 0 > green/brightness
> echo 255 > red/brightness
> echo 1 > sync
> 
> As opposed to just
> echo 255 > red/brightness
> 

Maybe other kernel developers, or sysfs maintainers like Greg, schould
also have a word about this.

Another solution, although not usable from shell, could be this:
  if a process opens all brightness files of a singled multicolor LED
  and then does a special SYNC_ON_THIS ioctl on one of them, then the
  sync is done when this color is written.
But that would also require ioctl for sysfs files, and I don't think
Greg would like that.

Dan's sync_enable API looks right to me from the one file/one value
sysfs rule as well - you can enable this setting (sync_enable) via one
file.

What is the main reason you guys are concerned about this?
That users will complain that they are writing to red/brightness and
the LED does not change color (because they did not disable
sync_enable)?

Marek
