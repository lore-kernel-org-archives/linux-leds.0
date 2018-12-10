From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: trigger named just "tx" in drivers/net/wireless/atmel/at76c50x-usb.c
Date: Mon, 10 Dec 2018 19:30:56 +0200
Message-ID: <87zhtd1e7j.fsf@kamboji.qca.qualcomm.com>
References: <20181201143144.GC31631@amd> <87lg57f182.fsf@codeaurora.org>
        <20181209200844.GA12756@amd>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181209200844.GA12756@amd> (Pavel Machek's message of "Sun, 9
        Dec 2018 21:08:44 +0100")
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, kernel list <linux-kernel@vger.kernel.org>, davem@davemloft.net, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Pavel Machek <pavel@ucw.cz> writes:

> On Mon 2018-12-03 10:45:01, Kalle Valo wrote:
>> Pavel Machek <pavel@ucw.cz> writes:
>> 
>> > While grepping something else, I came across LED trigger that is named
>> > just "tx".
>> >
>> > That's a bit too generic afaict?
>> >
>> > +++ b/drivers/net/wireless/atmel/at76c50x-usb.c
>> > @@ -520,7 +520,7 @@ static int at76_usbdfu_download(struct usb_device
>> > *udev, u8 *buf, u32 size,
>> >  static int tx_activity;
>> >   static void at76_ledtrig_tx_timerfunc(struct timer_list *unused);
>> >    static DEFINE_TIMER(ledtrig_tx_timer, at76_ledtrig_tx_timerfunc);
>> >    -DEFINE_LED_TRIGGER(ledtrig_tx);
>> >    +DEFINE_LED_TRIGGER(ledtrig_tx); /* Hey! "tx" is a bit too generic
>> >    name for a trigger! */
>> 
>> This is an ancient driver, my guess is that nobody uses it anymore. I
>> should orphan it and maybe even remove it at some point.
>
> Are you willing to add a fixme there? I really don't want people to
> copy that example.

Sure, patches welcome.

-- 
Kalle Valo
