From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v4 1/3] leds: Introduce userspace leds driver
Date: Tue, 8 Nov 2016 13:08:24 -0600
Message-ID: <0970c634-61ac-8ad7-088a-e47419c23455@lechnology.com>
References: <1474053410-24387-1-git-send-email-david@lechnology.com>
 <CGME20160916191722eucas1p1ceadfd878f28c36bae4c8bf33f582e6b@eucas1p1.samsung.com>
 <1474053410-24387-2-git-send-email-david@lechnology.com>
 <0bfdfd46-35e5-321c-5759-0cc96be862fd@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0bfdfd46-35e5-321c-5759-0cc96be862fd@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, Pavel Machek <pavel@ucw.cz>
List-Id: linux-leds@vger.kernel.org



On 11/8/16 5:26 AM, Jacek Anaszewski wrote:
> Hi David,
>

>> +struct uleds_device {
>> +    struct uleds_user_dev    user_dev;
>> +    struct led_classdev    led_cdev;
>> +    struct mutex        mutex;
>> +    enum uleds_state    state;
>> +    wait_queue_head_t    waitq;
>> +    unsigned char        brightness;
>
> I've just noticed that this is wrong, since LED subsystem
> brightness type is enum led_brightness, i.e. int.
> LED_FULL (255) value is a legacy enum value that can be overridden
> by max_brightness property.
>
> Please submit a fix so that I could merge it with the original
> patch before sending it upstream.
>
> Thanks,
> Jacek Anaszewski
>

The brightness should be a 32-bit integer then?
