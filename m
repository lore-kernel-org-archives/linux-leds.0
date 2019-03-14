From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH 2/4] leds: netdev trigger: factor out middle part of
 device_name_store
Date: Thu, 14 Mar 2019 10:57:55 +0100
Message-ID: <c6eb8d99-67ff-defd-31fc-fa55deb16b5b@rasmusvillemoes.dk>
References: <20190311144227.GA4404@amd>
 <20190313202615.22883-1-linux@rasmusvillemoes.dk>
 <20190313202615.22883-3-linux@rasmusvillemoes.dk>
 <20190314093111.7ivkdg7ozk4vylio@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190314093111.7ivkdg7ozk4vylio@pengutronix.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Pavel Machek <pavel@ucw.cz>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 14/03/2019 10.31, Uwe Kleine-König wrote:
> Hello,
> 
> On Wed, Mar 13, 2019 at 09:26:13PM +0100, Rasmus Villemoes wrote:
>> +static void set_device(struct led_netdev_data *trigger_data,
>> +		       const char *buf, size_t size)
> 
> "set_device" is a very generic name. Can you please prefix it with
> "ledtrig_netdev_"?

Sure. Will do next round.
