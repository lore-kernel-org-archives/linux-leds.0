From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/2] leds: tlc591xx: simplify driver by using the managed
 led API
Date: Fri, 5 Jul 2019 12:17:55 +0200
Message-ID: <20190705101755.gd36zbjz2p4x3yp6@devuan>
References: <20190701152602.31716-1-jjhiblot@ti.com>
 <20190701152602.31716-2-jjhiblot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190701152602.31716-2-jjhiblot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc: jacek.anaszewski@gmail.com, dmurphy@ti.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, tomi.valkeinen@ti.com
List-Id: linux-leds@vger.kernel.org

On Mon 2019-07-01 17:26:01, Jean-Jacques Hiblot wrote:
> Use the managed API of the LED class (devm_led_classdev_register()
> instead of led_classdev_register()).
> This allows us to remove the code used to track-and-destroy the LED devices
> 
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>

ack.

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
