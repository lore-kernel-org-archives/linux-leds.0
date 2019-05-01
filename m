From: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] leds: avoid races with workqueue
Date: Wed, 1 May 2019 18:41:54 +0200
Message-ID: <36e1fdd7-a220-4b0d-d558-829f522b0841@gmail.com>
References: <20190426123513.GA18172@amd> <20190426214246.GA24966@amd>
 <84fac57d-1121-a1da-fb45-16a2521bdef9@gmail.com> <20190427193411.GA9709@amd>
 <2578a614-beb9-1c9d-9f74-208a8a7ab64f@gmail.com> <20190427223207.GA3585@amd>
 <d2373c8b-5c66-c875-16c7-0c5a93470793@gmail.com> <20190429152259.GB10501@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20190429152259.GB10501@amd>
Content-Language: en-US
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

Thank you for the patch.

On 4/29/19 5:22 PM, Pavel Machek wrote:
> 
> There are races between "main" thread and workqueue. They manifest
> themselves on Thinkpad X60:
>      
> This should result in LED blinking, but it turns it off instead:
>      
>      root@amd:/data/pavel# cd /sys/class/leds/tpacpi\:\:power
>      root@amd:/sys/class/leds/tpacpi::power# echo timer > trigger
>      root@amd:/sys/class/leds/tpacpi::power# echo timer > trigger
>      root@amd:/sys/class/leds/tpacpi::power#
>      
> It should be possible to transition from blinking to solid on by echo
> 0 > brightness; echo 1 > brightness... but that does not work, either,
> if done too quickly.
>      
> Synchronization of the workqueue fixes both.
>      
> Signed-off-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
> 
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 68aa923..dcb59c8 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -57,6 +57,7 @@ static ssize_t brightness_store(struct device *dev,
>   	if (state == LED_OFF)
>   		led_trigger_remove(led_cdev);
>   	led_set_brightness(led_cdev, state);
> +	flush_work(&led_cdev->set_brightness_work);

Is this really required here? It creates non-uniform brightness
setting behavior depending on whether it is set from sysfs or
by in-kernel call to led_set_brightness().

>   	ret = size;
>   unlock:
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index 9f8da39..aefac4d 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -166,6 +166,11 @@ static void led_blink_setup(struct led_classdev *led_cdev,
>   		     unsigned long *delay_on,
>   		     unsigned long *delay_off)
>   {
> +	/*
> +	 * If "set brightness to 0" is pending in workqueue, we don't
> +	 * want that to be reordered after blink_set()
> +	 */
> +	flush_work(&led_cdev->set_brightness_work);
>   	if (!test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags) &&
>   	    led_cdev->blink_set &&
>   	    !led_cdev->blink_set(led_cdev, delay_on, delay_off))
> 

-- 
Best regards,
Jacek Anaszewski
