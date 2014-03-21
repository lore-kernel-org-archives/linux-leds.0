From: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH/RFC 1/8] leds: Add sysfs and kernel internal API for flash
 LEDs
Date: Fri, 21 Mar 2014 09:27:59 +0100
Message-ID: <532BF80F.1080602@samsung.com>
References: <1395327070-20215-1-git-send-email-j.anaszewski@samsung.com>
 <1395327070-20215-2-git-send-email-j.anaszewski@samsung.com>
 <1395329301.27611.4.camel@ted>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1395329301.27611.4.camel@ted>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Purdie <richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On 03/20/2014 04:28 PM, Richard Purdie wrote:
> On Thu, 2014-03-20 at 15:51 +0100, Jacek Anaszewski wrote:
>> Some LED devices support two operation modes - torch and
>> flash. This patch provides support for flash LED devices
>> in the LED subsystem by introducing new sysfs attributes
>> and kernel internal interface. The attributes being
>> introduced are: flash_mode, flash_timeout, max_flash_timeout,
>> flash_fault and hw_triggered.
>> The modifications aim to be compatible with V4L2 framework
>> requirements related to the flash devices management. The
>> design assumes that V4L2 driver can take of the LED class
>> device control and communicate with it through the kernel
>> internal interface. The LED sysfs interface is made
>> unavailable then.
>>
>> Signed-off-by: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Acked-by: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>> Cc: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
>> ---
>>   drivers/leds/led-class.c    |  216 +++++++++++++++++++++++++++++++++++++++++--
>>   drivers/leds/led-core.c     |  124 +++++++++++++++++++++++--
>>   drivers/leds/led-triggers.c |   17 +++-
>>   drivers/leds/leds.h         |    9 ++
>>   include/linux/leds.h        |  136 +++++++++++++++++++++++++++
>>   5 files changed, 486 insertions(+), 16 deletions(-)
>
> It seems rather sad to have to insert that amount of code into the core
> LED files for something which only a small number of LEDs actually use.
> This will increase the footprint of the core LED code significantly.
>
> Is it not possible to add this as a module/extension to the LED core
> rather than completely entangling them?

OK, I'll try to decouple it.

Thanks,
Jacek Anaszewski

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
