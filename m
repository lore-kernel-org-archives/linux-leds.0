From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard backlight trigger
Date: Thu, 24 Nov 2016 22:35:52 +0100
Message-ID: <5238be1f-d669-07e6-c796-5bc0126cb456@gmail.com>
References: <05766b18-026a-2af3-def8-9289ddb55234@samsung.com>
 <20161124153651.GL13735@pali>
 <dce7fff1-59cf-c155-2154-e6ea6bd7ee03@samsung.com> <201611241751.27696@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wj0-f194.google.com ([209.85.210.194]:35894 "EHLO
        mail-wj0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966216AbcKXVgk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 24 Nov 2016 16:36:40 -0500
In-Reply-To: <201611241751.27696@pali>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: gdg@zplane.com, Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

On 11/24/2016 05:51 PM, Pali Rohár wrote:
> On Thursday 24 November 2016 17:21:19 Jacek Anaszewski wrote:
>> On 11/24/2016 04:36 PM, Pali Rohár wrote:
>>> On Thursday 24 November 2016 16:32:06 Jacek Anaszewski wrote:
>>>> Since it has been reported that POLLPRI notifications on
>>>> brightness file can lead to increased power consumption, and
>>>> having my above statement I don't think that it is a good idea to
>>>> use brightness file for this.
>>>
>>> How is brightness file different from others that it cannot issue
>>> POLLPRI notification?
>>>
>>> I understood that problem is there in case that LED level is
>>> changed too many times per second (like by CPU trigger).
>>>
>>> If this is not that problem can you describe real issue, why we
>>> cannot use POLLPRI for brightness file?
>>
>> It would be inconsistent not to notify all brightness changes on
>> brightness file. We should notify all of them or none.
>
> I understood that we cannot notify about changes done by CPU trigger due
> to high power usage... Or not?

Exactly.

-- 
Best regards,
Jacek Anaszewski
