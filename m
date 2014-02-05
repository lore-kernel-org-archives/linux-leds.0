From: Mario Limonciello <mario_limonciello@dell.com>
Subject: Re: Implementing a platform driver w/ LEDs
Date: Wed, 05 Feb 2014 14:10:25 -0600
Message-ID: <52F29AB1.1020707@dell.com>
References: <52F28640.8080907@dell.com> <CAK5ve-K53uBu-7aCF9=FZdKBDcRN=1EeA-hdR8S2+L_mrvFTBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from ausxipps301.us.dell.com ([143.166.148.223]:29375 "EHLO
	ausxipps301.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755535AbaBEUKo (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 5 Feb 2014 15:10:44 -0500
In-Reply-To: <CAK5ve-K53uBu-7aCF9=FZdKBDcRN=1EeA-hdR8S2+L_mrvFTBA@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>

On 02/05/2014 01:25 PM, Bryan Wu wrote:
>
> I think for this use case, we need 2 drivers:
>
> 1. LED device driver for each lighting zone, it will supports red,
> blue, green and brightness operation.
>
> 2. LED trigger driver provides events trigger when system running,
> booting and suspended. It can send out event to your Alienware LED
> device driver to do proper LED operations.
>
> So the basic concept is splitting out real LED operations and event triggers.
Sorry, I should have clarified - the LEDs operations themselves are BIOS controlled.  I don't think there should be any trigger operation necessary.  It's a different WMI BIOS call to configure the LEDs in each different state.
>> When I first started to implement this using the LED class I create it with
>> 36 different LED nodes:
>>
>> alienware-wmi::running::head_red
>> alienware-wmi::running::head_blue
>> alienware-wmi::running::head_green
>> alienware-wmi::running::head_brightness
>> alienware-wmi::running::left_red
>> alienware-wmi::running::left_blue
>> alienware-wmi::running::left_green
>> alienware-wmi::running::left_brightness
>> alienware-wmi::running::right_red
>> alienware-wmi::running::right_blue
>> alienware-wmi::running::right_green
>> alienware-wmi::running::right_brightness
>>
>> alienware-wmi::booting::head_red
>> alienware-wmi::booting::head_blue
>> alienware-wmi::booting::head_green
>> alienware-wmi::booting::head_brightness
>> alienware-wmi::booting::left_red
>> alienware-wmi::booting::left_blue
>> alienware-wmi::booting::left_green
>> alienware-wmi::booting::left_brightness
>> alienware-wmi::booting::right_red
>> alienware-wmi::booting::right_blue
>> alienware-wmi::booting::right_green
>> alienware-wmi::booting::right_brightness
>>
>> alienware-wmi::suspend::head_red
>> alienware-wmi::suspend::head_blue
>> alienware-wmi::suspend::head_green
>> alienware-wmi::suspend::head_brightness
>> alienware-wmi::suspend::left_red
>> alienware-wmi::suspend::left_blue
>> alienware-wmi::suspend::left_green
>> alienware-wmi::suspend::left_brightness
>> alienware-wmi::suspend::right_red
>> alienware-wmi::suspend::right_blue
>> alienware-wmi::suspend::right_green
>> alienware-wmi::suspend::right_brightness
>>
>> I thought this was rather confusing though because each individual node only
>> has a single "brightness" member which doesn't really identify what is being
>> changed.  The brightness node changes the overall brightness of the whole
>> zone.  The color shades selected for each node are mixed to come up with the
>> overall color for the zone.
>>
>> The three different modes (running/booting/suspend) all modify the same LEDs
>> too, so it didn't seem to make sense to me that they had their own nodes.
>>
>> So given all of that, can you advise how you think this should be
>> implemented?  Would it make sense to extend the LED class to better adapt to
>> this?  Or do you think this is better suited for a custom sysfs interface as
>> I've already done?  I'll attach the patch for the driver so you can see how
>> I put it together with the custom sysfs interface.
>>
> I just went through the patch you attached quickly, but failed to find
> anything related to system booting/running/suspended. So you plan to
> do that by using user space script to talk with those sysfs interface?
It's already in there enum LIGHTING_CONTROL_STATE defines the three different states.  There's a sysfs node called lighting_control_state that was made to control it.

static DEVICE_ATTR(lighting_control_state, S_IRUGO | S_IWUSR,
                    show_control_state, set_control_state);

The idea here should be that later a userspace GUI will be able to toggle lighting_control_state to the right enum and then make any lighting color change requests.  The BIOS would handle the actual implementation of the right time it would be effective for.
