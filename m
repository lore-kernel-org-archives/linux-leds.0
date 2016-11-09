From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2] leds: ledtrig-heartbeat: Make top brightness adjustable
Date: Wed, 09 Nov 2016 12:50:52 +0100
Message-ID: <8f673a7e-3a35-314a-202c-a4998c4bbe0e@samsung.com>
References: <1478688226-4158-1-git-send-email-j.anaszewski@samsung.com>
 <CGME20161109112635epcas2p225952cdacd535b52b4bdc17e46378e29@epcas2p2.samsung.com>
 <20161109112117.GA1556@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:51871 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751969AbcKILvd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Nov 2016 06:51:33 -0500
In-reply-to: <20161109112117.GA1556@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

Hi Pavel,

On 11/09/2016 12:21 PM, Pavel Machek wrote:
> On Wed 2016-11-09 11:43:46, Jacek Anaszewski wrote:
>> LED class heartbeat trigger allowed only for blinking with max_brightness
>> value. This patch adds more flexibility by exploiting part of LED core
>> software blink infrastructure.
>>
>> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>
> Acked-by: Pavel Machek <pavel@ucw.cz>
>

Thanks. Reapplied on top of blink_brightness race fixes.

-- 
Best regards,
Jacek Anaszewski
