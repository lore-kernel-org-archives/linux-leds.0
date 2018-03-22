From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 4.9 v2 0/2] Clear LED_BLINK_SW flag in led_blink_set()
Date: Thu, 22 Mar 2018 11:58:11 +0100
Message-ID: <20180322105811.GA24775@kroah.com>
References: <1521487399-10447-1-git-send-email-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1521487399-10447-1-git-send-email-jacek.anaszewski@gmail.com>
Sender: stable-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, pavel@ucw.cz
List-Id: linux-leds@vger.kernel.org

On Mon, Mar 19, 2018 at 08:23:17PM +0100, Jacek Anaszewski wrote:
> The fix for brightness setting when setting delay_off=0 introduces
> a regression and has truncated commit message. Revert that patch
> and apply the one-line change required to fix the original issue
> in the way appropriate for the 4.9 code base.

Thanks, now queued up.

greg k-h
