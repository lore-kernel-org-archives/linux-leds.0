From: Tony Lindgren <tony@atomide.com>
Subject: Re: [GIT PULL v2] LM3532 backlight support improvements and
 relocation
Date: Mon, 8 Apr 2019 12:30:55 -0700
Message-ID: <20190408193055.GN49658@atomide.com>
References: <20190407190951.27288-1-jacek.anaszewski@gmail.com>
 <20190407221740.GA6327@amd>
 <f96d09dc-3ddc-4ac7-3668-508df430f686@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f96d09dc-3ddc-4ac7-3668-508df430f686@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Murphy <dmurphy@ti.com>
Cc: Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, robh@kernel.org, lee.jones@linaro.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

* Dan Murphy <dmurphy@ti.com> [190408 15:54]:
> On 4/7/19 5:17 PM, Pavel Machek wrote:
> > Plus, I'd kind of expect ALS enabled/disabled to be runtime controled,
> > not from the device tree.
> 
> We can always add runtime override control to the driver.

Yeah that sounds good to me :) Sounds like this can be done
with follow up patches though.

> Just need to see if there is a common interface from input or IIO we can adopt.

Hmm can the lm3532 registers actually show the value
for the ALS sensors?

Regards,

Tony
