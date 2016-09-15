From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v2] leds: Introduce userspace leds driver
Date: Thu, 15 Sep 2016 10:25:11 -0500
Message-ID: <48ba9d0b-9718-8411-3a1e-c2dd19f0adb5@lechnology.com>
References: <1473361440-9668-1-git-send-email-david@lechnology.com>
 <84510542-4faa-9763-611a-be3890f3f1f7@samsung.com>
 <CGME20160915130121eucas1p2c9d50e28e391714182b63eb29709847b@eucas1p2.samsung.com>
 <20160915130110.GI13132@amd>
 <69e2865f-8ba9-ea1a-594f-3de4131e3ea2@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <69e2865f-8ba9-ea1a-594f-3de4131e3ea2@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Pavel Machek <pavel@ucw.cz>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>
List-Id: linux-leds@vger.kernel.org

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
>>
>> (And is struct with char array good idea at all? Perphaps it can just
>> use write() length up to something reasonable, and not bother with new
>> header file for userspace?)
>
> In fact in this case the addition of another public header can be
> avoided.
>

The main reason I did it this way is in case someone wants to extend 
this to also, for example, set the max_brightness value. If we use an 
arbitrary size string, we could never add max_brightness without 
breaking userspace.

If we are sure we will never want to pass any other parameters other 
than name, then we can do away with the struct.
