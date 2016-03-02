From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v5 3/4] leds: core: add documentation for color extension
Date: Wed, 2 Mar 2016 10:48:30 +0100
Message-ID: <CAFSsGVvb-xukm=1RChtkyFojC3mJOs+vAm+HXcKdd5TA7dQGaQ@mail.gmail.com>
References: <56D609BB.1010804@gmail.com>
	<20160301214135.GA21265@kroah.com>
	<56D6A6A2.5080508@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33529 "EHLO
	mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752538AbcCBJsc (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 2 Mar 2016 04:48:32 -0500
In-Reply-To: <56D6A6A2.5080508@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-leds@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Mar 2, 2016 at 9:38 AM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> On 03/01/2016 10:41 PM, Greg KH wrote:
>>
>> On Tue, Mar 01, 2016 at 10:29:31PM +0100, Heiner Kallweit wrote:
>>>
>>> Document the color extension in Documentation/leds/leds-class.txt
>>>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>> ---
>>> v2:
>>> - introduced to patch series
>>> v3:
>>> - document extension in more detail
>>> v4:
>>> - Better explain why flag LED_SET_HUE_SAT is needed
>>> v5:
>>> - no changes
>>> ---
>>>   Documentation/leds/leds-class.txt | 27 ++++++++++++++++++++++-----
>>>   1 file changed, 22 insertions(+), 5 deletions(-)
>>
>>
>> What aboud Documentation/ABI/ ?
>>
Thanks for the hint. Will update also this part of the documentation.

>>
>
> Right, I haven't pushed for this so far, but now, as the functionality
> seems to be reaching its final shape, please update also:
>
> Documentation/ABI/testing/sysfs-class-led
>
>
> --
> Best regards,
> Jacek Anaszewski
