From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH AUTOSEL for 4.9 28/52] led: core: Fix brightness setting
 when setting delay_off=0
Date: Sat, 3 Feb 2018 22:22:51 +0100
Message-ID: <fb170821-02d5-8aff-5985-9df303f4030a@gmail.com>
References: <20180203180303.8490-1-alexander.levin@microsoft.com>
 <20180203180303.8490-28-alexander.levin@microsoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180203180303.8490-28-alexander.levin@microsoft.com>
Sender: stable-owner@vger.kernel.org
To: Sasha Levin <Alexander.Levin@microsoft.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Sasha,

All 3.18, 4.4 and 4.9 also require the follow-up
patch [0], similarly like autosel did it for 4.14,
since this one alone breaks the other use case.

[0] https://lkml.org/lkml/2018/2/3/249

On 02/03/2018 07:03 PM, Sasha Levin wrote:
> From: Matthieu CASTET <matthieu.castet@parrot.com>
> 
> [ Upstream commit 2b83ff96f51d0b039c4561b9f95c824d7bddb85c ]
> 
> With the current code, the following sequence won't work :
> echo timer > trigger
> 
> echo 0 >  delay_off
> * at this point we call
> ** led_delay_off_store
> ** led_blink_set
> *** stop timer
> ** led_blink_setup
> ** led_set_software_blink
> *** if !delay_on, led off
> *** if !delay_off, set led_set_brightness_nosleep <--- LED_BLINK_SW is set but timer is stop
> *** otherwise start timer/set LED_BLINK_SW flag
> 
> echo xxx > brightness
> * led_set_brightness
> ** if LED_BLINK_SW
> *** if brightness=0, led off
> *** else apply brightness if next timer <--- timer is stop, and will never apply new setting
> ** otherwise set led_set_brightness_nosleep
> 
> To fix that, when we delete the timer, we should clear LED_BLINK_SW.
> 
> Cc: linux-leds@vger.kernel.org
> Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Sasha Levin <alexander.levin@microsoft.com>
> ---
>  drivers/leds/led-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index 3bce44893021..d70d4a5273b8 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -186,7 +186,7 @@ void led_blink_set(struct led_classdev *led_cdev,
>  		   unsigned long *delay_on,
>  		   unsigned long *delay_off)
>  {
> -	del_timer_sync(&led_cdev->blink_timer);
> +	led_stop_software_blink(led_cdev);
>  
>  	led_cdev->flags &= ~LED_BLINK_ONESHOT;
>  	led_cdev->flags &= ~LED_BLINK_ONESHOT_STOP;
> 

-- 
Best regards,
Jacek Anaszewski
