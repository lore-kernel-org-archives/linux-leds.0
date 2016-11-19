From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard backlight trigger
Date: Sat, 19 Nov 2016 16:44:09 +0100
Message-ID: <7b8252c4-bb2a-01dd-2404-9b81c192fb6a@gmail.com>
References: <20161117222441.31464-1-hdegoede@redhat.com>
 <CGME20161117222450epcas2p28613abfdc50444385e6849315754f51c@epcas2p2.samsung.com>
 <20161117222441.31464-2-hdegoede@redhat.com>
 <af5a6b68-310d-85ec-16db-5c9036f38ba5@samsung.com>
 <39fdea9c-b2de-7fb6-3acf-0ea1de73ea75@redhat.com>
 <92a919a7-6849-60b6-d018-f9e983e7a2f5@samsung.com>
 <55cdf83d-2233-151f-08e1-11d4619e8fd5@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36700 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753157AbcKSPo4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Nov 2016 10:44:56 -0500
In-Reply-To: <55cdf83d-2233-151f-08e1-11d4619e8fd5@redhat.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

Hi,

On 11/18/2016 07:47 PM, Hans de Goede wrote:
> HI,
>
> On 18-11-16 17:03, Jacek Anaszewski wrote:
>> Hi,
>>
>> On 11/18/2016 10:07 AM, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 18-11-16 09:55, Jacek Anaszewski wrote:
>>>> Hi Hans,
>>>>
>>>> Thanks for the patch.
>>>>
>>>> I think we need less generic trigger name.
>>>> With present name we pretend that all kbd-backlight controllers
>>>> can change LED brightness autonomously.
>>>>
>>>> How about kbd-backlight-pollable ?
>>>
>>> This is a trigger to control kbd-backlights, in the
>>> current use-case the brightness change is already done
>>> by the firmware, hence the set_brightness argument to
>>> ledtrig_kbd_backlight(), so that we can avoid setting
>>> it again.
>>>
>>> But I can see future cases where we do want to have some
>>> event (e.g. a wmi hotkey event on a laptop where the firmware
>>> does not do the adjustment automatically) which does
>>> lead to actually updating the brightness.
>>>
>>> So I decided to go with a generic kbd-backlight trigger,
>>> which in the future can also be used to directly control
>>> kbd-backlight brightness; and not just to make ot
>>> poll-able.
>>
>> I thought that kbd-backlight stands for "keyboard backlight",
>
> It does.
>
>> that's why I assessed it is too generic.
>
> The whole purpose of the trigger as implemented is to be
> generic, as it seems senseless to implement a one off
> trigger for just the dell / thinkpad case.
>
>> It seems however to be
>> the other way round - if kbd-backlight means that this is
>> a trigger only for use with dell-laptop keyboard driver
>> (I see kbd namespacing prefix in the driver functions) than it is
>> not generic at all.
>
> The trigger as implemented is generic, if you think
> otherwise, please let me know which part is not generic
> according to you.

I think I was too meticulous here. In the end of the previous
message I mentioned that we cannot guarantee that all keyboard
backlight controllers can adjust brightness autonomously. Nonetheless,
for the ones that cannot do that it would make no sense to have
a trigger. In view of that this trigger is generic enough.

I'll wait for Pavel's opinion before merging the patch set
as he was also involved in this whole thread.

-- 
Best regards,
Jacek Anaszewski
