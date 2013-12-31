From: Joe Xue <lgxue@hotmail.com>
Subject: RE: [PATCH] Add LED pattern trigger
Date: Tue, 31 Dec 2013 00:00:39 -0500
Message-ID: <BLU172-W18A7B97F4E688F416C5DABACC90@phx.gbl>
References: <1388362275-1618-1-git-send-email-lgxue@hotmail.com>,<20131230183302.GA28430@amd.pavel.ucw.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20131230183302.GA28430@amd.pavel.ucw.cz>
Sender: linux-doc-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: "cooloney@gmail.com" <cooloney@gmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "rob@landley.net" <rob@landley.net>, "milo.kim@ti.com" <milo.kim@ti.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

> What about something like this?
>
> Not shcheduling timer when nothing changed should save a bit of power/cpu...
>
> if (pattern_data->pattern[pattern_data->count] == '/') {
> return;
> }
>
> this = pattern_data->pattern[pattern_data->count]
> if (this == '#')
> new_brigtness = pattern_data->brightness_on;
> if (this == ' ')
> new_brigtness = LED_OFF;
> repeat = 1;
> while (pattern_data->pattern[pattern_data->count + repeat] == this)
> repeat++;
>
> mod_timer(&pattern_data->timer,
> jiffies + msecs_to_jiffies(pattern_data->delay_unit * repeat));
>
>
Working on it.

Thanks for your help.

Joe 		 	   		  