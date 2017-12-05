From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH/RFC] DT: leds: Fix 'label' property description and add
 'colour' property
Date: Tue, 5 Dec 2017 20:52:09 +0100
Message-ID: <59b22e80-d63a-9194-4e40-9c86eac18258@gmail.com>
References: <1512251410-6084-1-git-send-email-jacek.anaszewski@gmail.com>
 <20171204104351.GA6611@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:43285 "EHLO
        mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751156AbdLETxG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 5 Dec 2017 14:53:06 -0500
In-Reply-To: <20171204104351.GA6611@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org, sakari.ailus@iki.fi, dmurphy@ti.com

Hi Pavel,

On 12/04/2017 11:43 AM, Pavel Machek wrote:
> Hi!
> 
>> Label property was imposed a uniqueness requirement, which was erroneous,
>> since ePAPR defines it to "a human readable string describing a device".
>>
>> Also the binding description misleadingly suggested direct usage of label
>> for LED class device name, whereas it should only define a LED function.
>>
>> Therefore an additional 'colour' property is being introduced, which together
>> with the parent DT node name used for devicename shall be used for naming LED
>> class device according to the patterh
>> <devicename>:<colour>:<function>.
> 
> 
>> -- label : The label for this LED. If omitted, the label is taken from the node
>> -	  name (excluding the unit address). It has to uniquely identify
>> -	  a device, i.e. no other LED class device can be assigned the same
>> -	  label.
>> +- label : The label for this LED. It should describe its function. If omitted,
>> +          the label is taken from the node name (excluding the unit address).
> 
> So the label contains "as1235:green:capslock"? I guess it might be
> nice to mention that. Or just the "capslock" part?

Linguistic fix:

s/It should describe its function/It should describe LED's function/

So in your example it would be "capslock" part alone. Existing examples
already show that properly IMO.

> 
> Also.. it would be good to start pushing for more consistency in the
> labels: I have these on the thinkpad:
> 
> input5::scrolllock/   tpacpi::dock_status2/ tpacpi::unknown_led/
> mmc0::/               tpacpi:green:batt/    tpacpi::unknown_led2/
> phy0-led/             tpacpi:orange:batt/   tpacpi::unknown_led3/
> tpacpi::bay_active/   tpacpi::power/
> 
> On embedded system, I'd like to see <devicename> to corespond
> to.. device the led belongs to, as opposed to name of the chip that
> drives the led. Maybe we should do 'main_camera:white:flash' instead of
> 'as4132:white:flash' because userspace already has information on what
> chip it is (sysfs paths), but can not easily figure out to which
> device the flash belongs.

It would be inconsistent with current design of V4L2 media device,
which presents every media entity with chip name.
Also, it would be hard to prove that LED controller is part of the
main camera hardware when it is a standalone chip.

>> +- colour : Colour of the LED.
>>  
>>  - default-state : The initial state of the LED. Valid values are "on", "off",
>>    and "keep". If the LED is already on or off and the default-state
>> -	  property is
> 
> Best regards,
> 								Pavel
> 
> 

-- 
Best regards,
Jacek Anaszewski
