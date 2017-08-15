From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2] leds: add LED driver for CR0014114 board
Date: Tue, 15 Aug 2017 19:42:46 +0200
Message-ID: <33519a27-a953-ac36-283e-13dff019082f@gmail.com>
References: <20170814115355.9437-1-oleg@kaa.org.ua>
 <a3b2efc2-8501-207e-363d-975d1a3ed0ff@gmail.com>
 <e1d38ada-2413-90ac-c297-890429385862@kaa.org.ua>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f170.google.com ([209.85.128.170]:34048 "EHLO
        mail-wr0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751580AbdHORnb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Aug 2017 13:43:31 -0400
Received: by mail-wr0-f170.google.com with SMTP id y96so1895034wrc.1
        for <linux-leds@vger.kernel.org>; Tue, 15 Aug 2017 10:43:30 -0700 (PDT)
In-Reply-To: <e1d38ada-2413-90ac-c297-890429385862@kaa.org.ua>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Oleh Kravchenko <oleg@kaa.org.ua>, linux-leds@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pavel Machek <pavel@ucw.cz>

Hi Oleh,

On 08/15/2017 02:28 PM, Oleh Kravchenko wrote:
> Hi Jacek,
> 
> Thanks for your comments, please see my replies below.
> 
> On 14.08.17 22:44, Jacek Anaszewski wrote:
>> Hi Oleh,
>>
>> Thanks for the patch. Please see my comments below.
>>
>> On 08/14/2017 01:53 PM, Oleh Kravchenko wrote:
>>> This patch adds a LED class driver for the RGB LEDs found on
>>> the Crane Merchandising System CR0014114 LEDs board.
>>>
>>> Driver creates LED devices with name written using the following
>>> pattern "LABEL-{N}:{red,green,blue}:".
>> LED device naming is already defined to "devicename:colour:function"
>> in Documentation/leds/leds-class.txt. Please stick to this scheme.
> 
> I tried to follow this rule with this pattern "LABEL-{N}:{red,green,blue}:".
> What is wrong with it?
> 
> Can I use this pattern?
> cr0014114:red:0
> cr0014114:green:0
> cr0014114:blue:0
> cr0014114:red:1
> cr0014114:green:1
> cr0014114:blue:1
> cr0014114:red:2
> cr0014114:green:2
> cr0014114:blue:2
> ...

This pattern looks fine. How "LABEL-(N)" corresponds with cr0014114?
This description is misleading.

>>> +static void cr0014114_calc_crc(u8 *buf, const size_t len)
>>> +{
>>> +	u8	crc;
>>> +	size_t	i;
>>> +
>>> +	for (i = 1, crc = 1; i < len - 1; i++)
>>> +		crc += buf[i];
>>> +
>>> +	crc |= BIT(7);
>>> +
>>> +	/* special case when CRC matches to SPI commands */
>>> +	switch (crc) {
>>> +	case CMD_SET_BRIGHTNESS:
>>> +	case CMD_INIT_REENUMERATE:
>>> +	case CMD_NEXT_REENUMERATE:
>>> +		crc = 0xfe;
>>> +		break;
>>> +	}
>> Wouldn't "if" fit better here?
> 
> I tried it's looks ugly for me, but if you insist I will use "if".
> 
>     if (crc == CMD_SET_BRIGHTNESS ||
>         crc == CMD_INIT_REENUMERATE ||
>         crc == CMD_NEXT_REENUMERATE)
>             crc = 0xfe;

It better reflects what is going on here. switch suggests
the need to differentiate actions depending on multiple possible
states, which is not the case here.

>>> +
>>> +	buf[len - 1] = crc;
>>> +}
>>> +
>>> +static void cr0014114_leds_work(struct work_struct *work)
>>> +{
>>> +	int			ret;
>>> +	size_t			i;
>>> +	struct cr0014114	*priv = container_of(work,
>>> +					struct cr0014114, leds_work);
>>> +	u8			data[priv->leds_count + 2];
>>> +	unsigned long		udelay, now = jiffies;
>>> +
>>> +	/* to avoid SPI mistiming with firmware we should wait some time */
>>> +	if (time_after(priv->leds_delay, now)) {
>>> +		udelay = jiffies_to_usecs(priv->leds_delay - now);
>>> +		usleep_range(udelay, udelay + 1);
>>> +	}
>>> +
>>> +	data[0] = CMD_SET_BRIGHTNESS;
>>> +	for (i = 0; i < priv->leds_count; i++)
>>> +		data[i + 1] = priv->leds[i].brightness;
>> Why do you set three LEDs at once? We expose each LED as a single
>> LED class device in the LED subsystem.
> 
> Unfortunately board should receive brightness
> for all 18 LEDs (or 6 RGB LEDs) at one time.
> 
> On CR0014114 you can't update only one LED, you should update them all :)

Ack.

>>> +	cr0014114_calc_crc(data, sizeof(data));
>>> +
>>> +	ret = spi_write(priv->spi, data, sizeof(data));
>> Could you please describe the layout of registers driving the brightness
>> of each LED ?
> 
> +----+-----------------------------------+----+
> | CMD|             BRIGHTNESS            |CRC |
> +----+-----------------------------------+----+
> |    | LED0| LED1| LED2| LED3| LED4| LED5|    |
> |    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+    |
> |    |R|G|B|R|G|B|R|G|B|R|G|B|R|G|B|R|G|B|    |
> | 1  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ 1  |
> |    |1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|    |
> |    +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+    |
> |    |               18                  |    |
> +----+-----------------------------------+----+
> |                    20                       |
> +---------------------------------------------+
> 
> Boards can be connected to the chain:
>     SPI -> board0 -> board1 -> board2 ..
> 
> in this case only BRIGHTNESS length (18 -> 36 -> 54) will be increased.

Thanks for the description.

> 
>>> +	if (ret)
>>> +		dev_err(priv->dev, "spi_write() error %d\n", ret);
>>> +
>>> +	priv->leds_delay = jiffies + msecs_to_jiffies(DEF_FW_DELAY_MSEC);
>>> +}
>>> +
>>> +static void cr0014114_test(struct cr0014114 *priv)
>>> +{
>>> +	unsigned int		mdelay;
>>> +	size_t			i;
>>> +	struct led_classdev	*ldev;
>>> +
>>> +	/* blink all LEDs in 500 milliseconds */
>>> +	mdelay = 500 / priv->leds_count - DEF_FW_DELAY_MSEC;
>>> +	if (mdelay < DEF_FW_DELAY_MSEC)
>>> +		mdelay = DEF_FW_DELAY_MSEC;
>>> +
>>> +	for (i = 0; i < priv->leds_count; i++) {
>>> +		ldev = &priv->leds[i].ldev;
>>> +
>>> +		ldev->brightness_set(ldev, DEF_MAX_BRIGHTNESS);
>>> +		msleep(mdelay);
>>> +		ldev->brightness_set(ldev, LED_OFF);
>>> +	}
>>> +}
>> Is this function really required? It seems to mimic timer trigger.
> 
> No, this function is not really needed.
> I will remove it.
> 
>>> +	queue_work(led->priv->wq, &led->priv->leds_work);
>>> +}
>>> +
>>> +static int cr0014114_led_create(struct cr0014114 *priv,
>>> +				struct cr0014114_led *led,
>>> +				size_t id,
>>> +				const char *color)
>>> +{
>>> +	int ret;
>>> +
>>> +	led->priv = priv;
>>> +	snprintf(led->name, sizeof(led->name), "%s-%zd:%s:",
>>> +		 priv->label, id, color);
>>> +
>>> +	led->ldev.name			= led->name;
>>> +	led->ldev.brightness		= LED_OFF;
>>> +	led->ldev.max_brightness	= DEF_MAX_BRIGHTNESS;
>>> +	led->ldev.brightness_set	= cr0014114_set_brightness;
>> Please use brightness_set_blocking op and remove workqueue.
> 
> If driver will send data often than 10 ms, board will hangs up.
> How I can workaround it with brightness_set_blocking?

brightness_set_blocking op is executed in the workqueue internally
by the LED core, so you can sleep in it safely.

>>> +
>>> +	/* setup recount timer to workaround buggy firmware */
>>> +	mod_timer(&priv->recount_timer, jiffies + DEF_RECOUNT_DELAY);
>> Could you share some details on why it is needed?
> 
> Board (or boards if they in chain) time to time losing synchronization
> with SPI.
> So we should recount LEDs on them to avoid this.

Is it recommended way to fix the issue?
Is there an openly available documentation for this LED controller?

>From the code it looks like the recount can result in spurious
LED blinks.

-- 
Best regards,
Jacek Anaszewski
