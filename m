From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 2/4] leds: netdev trigger: factor out middle part of
 device_name_store
Date: Thu, 14 Mar 2019 10:31:11 +0100
Message-ID: <20190314093111.7ivkdg7ozk4vylio@pengutronix.de>
References: <20190311144227.GA4404@amd>
 <20190313202615.22883-1-linux@rasmusvillemoes.dk>
 <20190313202615.22883-3-linux@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190313202615.22883-3-linux@rasmusvillemoes.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hello,

On Wed, Mar 13, 2019 at 09:26:13PM +0100, Rasmus Villemoes wrote:
> +static void set_device(struct led_netdev_data *trigger_data,
> +		       const char *buf, size_t size)

"set_device" is a very generic name. Can you please prefix it with
"ledtrig_netdev_"?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
