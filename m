From: Willy Tarreau <w@1wt.eu>
Subject: Re: [PATCH] leds: ledtrig-morse: send out morse code
Date: Thu, 28 Jun 2018 20:21:50 +0200
Message-ID: <20180628182150.GA29858@1wt.eu>
References: <20180628134227.GA1719@arbeit>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180628134227.GA1719@arbeit>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Klinger <ak@it-klinger.de>
Cc: jacek.anaszewski@gmail.com, pavel@ucw.cz, ben.whitten@gmail.com, geert+renesas@glider.be, pombredanne@nexb.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Thu, Jun 28, 2018 at 03:42:27PM +0200, Andreas Klinger wrote:
> Send out a morse code by using LEDs.
> 
> This is useful especially on embedded systems without displays to tell the
> user about error conditions and status information.
> 
> The trigger will be called "morse"
> 
> The string to be send is written into the file morse_string and sent out
> with a workqueue. Supported are letters and digits.
> 
> With the file dot_unit the minimal time unit can be adjusted in
> milliseconds.

Wow, I really love the idea!

Willy
