From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/4] leds: netdev trigger: use memcpy in device_name_store
Date: Thu, 14 Mar 2019 10:29:29 +0100
Message-ID: <20190314092929.65amwzsaswcvsexl@pengutronix.de>
References: <20190311144227.GA4404@amd>
 <20190313202615.22883-1-linux@rasmusvillemoes.dk>
 <20190313202615.22883-2-linux@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190313202615.22883-2-linux@rasmusvillemoes.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hello,

On Wed, Mar 13, 2019 at 09:26:12PM +0100, Rasmus Villemoes wrote:
> --- a/drivers/leds/trigger/ledtrig-netdev.c
> +++ b/drivers/leds/trigger/ledtrig-netdev.c
> @@ -122,7 +122,8 @@ static ssize_t device_name_store(struct device *dev,
>  		trigger_data->net_dev = NULL;
>  	}
>  
> -	strncpy(trigger_data->device_name, buf, size);
> +	memcpy(trigger_data->device_name, buf, size);
> +	trigger_data->device_name[size] = '\0';

This is open-coding

	strlcpy(trigger_data->device_name, buf, size);

Best regards
Uwe

>  	if (size > 0 && trigger_data->device_name[size - 1] == '\n')
>  		trigger_data->device_name[size - 1] = 0;

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
