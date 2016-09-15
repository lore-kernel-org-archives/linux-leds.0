From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v2] leds: Introduce userspace leds driver
Date: Thu, 15 Sep 2016 11:16:38 -0500
Message-ID: <5afff180-a104-7742-8ba9-d5f8c2245b76@lechnology.com>
References: <1473361440-9668-1-git-send-email-david@lechnology.com>
 <84510542-4faa-9763-611a-be3890f3f1f7@samsung.com>
 <CGME20160915130121eucas1p2c9d50e28e391714182b63eb29709847b@eucas1p2.samsung.com>
 <20160915130110.GI13132@amd>
 <69e2865f-8ba9-ea1a-594f-3de4131e3ea2@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from vern.gendns.com ([206.190.152.46]:52656 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753508AbcIOQQm (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 15 Sep 2016 12:16:42 -0400
In-Reply-To: <69e2865f-8ba9-ea1a-594f-3de4131e3ea2@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Pavel Machek <pavel@ucw.cz>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>

On 09/15/2016 09:54 AM, Jacek Anaszewski wrote:
> Hi Pavel,
>
> On 09/15/2016 03:01 PM, Pavel Machek wrote:
>> Hi!
>>
>>>> @@ -0,0 +1,23 @@
>>>> +/*
>>>> + * Userspace driver support for leds subsystem
>>>> + *
>>>> + * This program is free software; you can redistribute it and/or
>>>> modify
>>>> + * it under the terms of the GNU General Public License as
>>>> published by
>>>> + * the Free Software Foundation; either version 2 of the License, or
>>>> + * (at your option) any later version.
>>>> + *
>>>> + * This program is distributed in the hope that it will be useful,
>>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>>> + * GNU General Public License for more details.
>>>> + */
>>>> +#ifndef _UAPI__ULEDS_H_
>>>> +#define _UAPI__ULEDS_H_
>>>> +
>>>> +#define ULEDS_MAX_NAME_SIZE    80
>>>> +
>>>> +struct uleds_user_dev {
>>>> +    char name[ULEDS_MAX_NAME_SIZE];
>>>> +};
>>
>> We already have path component length limit somewhere, right? Just use
>> it?

As a matter of fact, in led_classdev_register(), the name is limited to 
64. This is hard-coded (no #define).

      char name[64];

The given name is truncated to this length in a call to 
led_classdev_next_name().

>>
>> (And is struct with char array good idea at all? Perphaps it can just
>> use write() length up to something reasonable, and not bother with new
>> header file for userspace?)
>
> In fact in this case the addition of another public header can be
> avoided.
>
