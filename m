From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v4 1/3] leds: Introduce userspace leds driver
Date: Wed, 09 Nov 2016 09:44:29 +0100
Message-ID: <0a01e033-b04a-0ffb-b694-ac55649a7623@samsung.com>
References: <1474053410-24387-1-git-send-email-david@lechnology.com>
 <CGME20160916191722eucas1p1ceadfd878f28c36bae4c8bf33f582e6b@eucas1p1.samsung.com>
 <1474053410-24387-2-git-send-email-david@lechnology.com>
 <0bfdfd46-35e5-321c-5759-0cc96be862fd@samsung.com> <20161109070514.GA18969@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20161109070514.GA18969@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: David Lechner <david@lechnology.com>, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, Hans de Goede <hdegoede@redhat.com>
List-Id: linux-leds@vger.kernel.org

Hi,

On 11/09/2016 08:05 AM, Pavel Machek wrote:
> Hi!
>
>>> +struct uleds_device {
>>> +	struct uleds_user_dev	user_dev;
>>> +	struct led_classdev	led_cdev;
>>> +	struct mutex		mutex;
>>> +	enum uleds_state	state;
>>> +	wait_queue_head_t	waitq;
>>> +	unsigned char		brightness;
>>
>> I've just noticed that this is wrong, since LED subsystem
>> brightness type is enum led_brightness, i.e. int.
>> LED_FULL (255) value is a legacy enum value that can be overridden
>> by max_brightness property.
>>
>> Please submit a fix so that I could merge it with the original
>> patch before sending it upstream.
>
> Actually... perhaps you want to wait with merging the userspace driver
> till the locking is solved in the LED subsystem? Maybe I'm wrong, but
> I have feeling that userspace driver will have unusual requirements
> w.r.t. locking, and that it would be good to have that solved,
> first...

If you think about locking between led_set_brightness() and
led_update_brightness() then we have no ready solution for that.
Do you have any?

If not then we have to live with that until one is devised.
After adding the locking in brightness_show the risk of races will be
only in case of concurrent calls to led_set_brightness() and
led_update_brightness() from kernel, whereas currently there are no
such use cases.

-- 
Best regards,
Jacek Anaszewski
