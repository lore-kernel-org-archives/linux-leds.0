From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v7 02/16] leds: triggers: let struct
 led_trigger::activate() return an error code
Date: Thu, 5 Jul 2018 23:31:28 +0200
Message-ID: <1172a776-a951-28d5-fae4-824969f4a82b@gmail.com>
References: <a9b3548b-09c4-fae4-1bce-abf3392b9ceb@gmail.com>
 <20180702200535.1337-2-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180702200535.1337-2-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Pavel Machek <pavel@ucw.cz>, kernel@pengutronix.de, linux-leds@vger.kernel.org, kernel-patch-test@lists.linaro.org, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, "David S. Miller" <davem@davemloft.net>, Johannes Berg <johannes@sipsolutions.net>, linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Uwe,

On 07/02/2018 10:05 PM, Uwe Kleine-König wrote:
> Given that activating a trigger can fail, let the callback return an
> indication. This prevents to have a trigger active according to the
> "trigger" sysfs attribute but not functional.
> 
> All users are changed accordingly to return 0 for now. There is no intended
> change in behaviour.
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
[...]
> -static void ieee80211_tx_led_activate(struct led_classdev *led_cdev)
> +static int ieee80211_tx_led_activate(struct led_classdev *led_cdev)
>   {
>   	struct ieee80211_local *local = container_of(led_cdev->trigger,
>   						     struct ieee80211_local,
>   						     tx_led);
>   
>   	atomic_inc(&local->tx_led_active);
> +
> +	return 0
[...]

s/return 0/return 0;/

Fixed it up and applied. I'm taking lack of net maintainer feedback
as a tacit approval (or lack of interest).

-- 
Best regards,
Jacek Anaszewski
