From: Joe Xue <lgxue@hotmail.com>
Subject: RE: [PATCH v3 1/1] leds: Add LED pattern trigger
Date: Mon, 6 Jan 2014 17:10:34 -0500
Message-ID: <BLU172-W27FA5477DF3AA1C93A75C0ACB70@phx.gbl>
References: <1388362275-1618-1-git-send-email-lgxue@hotmail.com>,<1389044834-22870-1-git-send-email-lgxue@hotmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1389044834-22870-1-git-send-email-lgxue@hotmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "cooloney@gmail.com" <cooloney@gmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "rob@landley.net" <rob@landley.net>, "milo.kim@ti.com" <milo.kim@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

> From: Joe Xue <lgxue@hotmail.com>
>
> The LED pattern trigger allows LEDs blink in user defined pattern.
>
> v2: Change the pattern memory from fixed static to malloc
> Change the timer schedule way to save cpu time
> Add the mutex to protect the pattern operation
>
> v3: Tiny fix, add the missed parameter in example of document
>
> new file: Documentation/leds/ledtrig-pattern.txt
> modified: drivers/leds/trigger/Kconfig
> modified: drivers/leds/trigger/Makefile
> new file: drivers/leds/trigger/ledtrig-pattern.c
>
> Signed-off-by: Joe Xue <lgxue@hotmail.com>
> ---

Forgot to add suggested-by line:

Suggested-by: Pavel Machek <pavel@ucw.cz>

I would like to give too much credit to this buddy.

Joe 		 	   		  