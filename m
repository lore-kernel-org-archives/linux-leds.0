From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 2/2] leds: Add driver for NCP5623 3-channel I2C LED driver
Date: Mon, 27 Jun 2016 09:09:08 +0200
Message-ID: <5770D114.70909@samsung.com>
References: <1466494154-3786-1-git-send-email-florian.vaussard@heig-vd.ch>
 <1466494154-3786-3-git-send-email-florian.vaussard@heig-vd.ch>
 <57695D45.60107@samsung.com> <20160626214902.GB21026@amd>
 <51f6c4d4-e5af-97b6-e7d9-61f0093de134@heig-vd.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:57109 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750870AbcF0HJM (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 27 Jun 2016 03:09:12 -0400
In-reply-to: <51f6c4d4-e5af-97b6-e7d9-61f0093de134@heig-vd.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Florian Vaussard <florian.vaussard@heig-vd.ch>
Cc: Pavel Machek <pavel@ucw.cz>, Florian Vaussard <florian.vaussard@gmail.com>, devicetree@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Florian and Pavel,

On 06/27/2016 07:46 AM, Florian Vaussard wrote:
> Hi Pavel,
>
> Le 26. 06. 16 =E0 23:49, Pavel Machek a =E9crit :
>> Hi!
>>
>>>> +struct ncp5623_led {
>>>> +	bool active;
>>>> +	unsigned int led_no;
>>>> +	struct led_classdev ldev;
>>>> +	struct work_struct work;
>>>> +	struct ncp5623_priv *priv;
>>>> +};
>>>> +
>>>> +struct ncp5623_priv {
>>>> +	struct ncp5623_led leds[NCP5623_MAX_LEDS];
>>>
>>> Please allocate memory dynamically, depending on the number
>>> of LEDs defined in a Device Tree.
>>
>> MAX_LEDs is three. Are you sure overhead of dynamic allocation is
>> worth it?
>>
>> And if this is for RGB leds... very probably device will want to use
>> all 3 channels.
>>
>
> I was about to raise the same question during the v2 of this patch. I=
n addition
> to your arguments, this also changes the way this array is indexed.
>
> Currently the LED number is used as index, but with dynamic allocatio=
n I have to
> use an abstract index. This makes some logic a bit harder, especially=
 to check
> if the same LED is declared twice in the device tree (duplicated 'reg=
' property).

=46air enough. Please ignore my remark then.

--=20
Best regards,
Jacek Anaszewski
