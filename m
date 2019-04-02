From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [RFC PATCH 3/5] documention: leds: Add multicolor class
 documentation
Date: Tue, 2 Apr 2019 06:53:30 -0500
Message-ID: <e2621a54-4c5c-4235-9aba-39a856cfbe88@ti.com>
References: <20190401173400.14238-1-dmurphy@ti.com>
 <20190401173400.14238-4-dmurphy@ti.com> <20190401212709.GA14681@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190401212709.GA14681@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: robh+dt@kernel.org, jacek.anaszewski@gmail.com, marek.behun@nic.cz, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Pavel

Thanks for the comments

On 4/1/19 4:27 PM, Pavel Machek wrote:
> Hi!
> 
>> +Under the "colors" directory there are two files created "sync" and
>> +"sync_enable". The sync_enable file controls whether the LED brightness
>> +value is set real time or if the LED brightness value setting is deferred until
>> +the "sync" file is written.  If sync_enable is set then writing to each LED
>> +"brightness" file will store the brightness value.  Once the "sync" file is
>> +written then each LED color defined in the node will write the brightness of
>> +the LED in the device driver.
>> +
>> +If "sync_enable" is not set then writing the brightness value of the LED to the
>> +device driver is done immediately.  Writing the "sync" file has no
>> affect.
> 
> I believe better solutions exists for this problem.
> 

I agree there are other solutions.  Better not so sure.
We keep kicking a solution down the road we have been talking about adding something to the kernel
for almost 5 months now, but no one can decide what to do.

How do we move a solution forward?
Should we just forget the whole idea and keep developing against the current framework?

> One was discussed before -- have single file which contains
> coefficients for r/g/b channels.
> 

That has been presented as well and the concept was not well received either.

> Or at least... you should not really need separate sync and
> sync_enable files. One should do.
> 

The idea here was to be able to set the LED brightness immediately on a single LED
with a single brightness write or setup the color brightness on all the LEDs and then
sync the LED brightnesses.

If you wanted to control a single LED for notifications the user space may have to do

echo 0 > blue/brightness
echo 0 > green/brightness
echo 255 > red/brightness
echo 1 > sync

As opposed to just
echo 255 > red/brightness

But if that is not a concern then removing the sync_enable is fine with me from a code standpoint
but not from a user space side.

Dan

> 									Pavel
> 


-- 
------------------
Dan Murphy
