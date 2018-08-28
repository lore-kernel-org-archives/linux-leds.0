From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH] leds: Convert to using %pOFn instead of device_node.name
Date: Tue, 28 Aug 2018 14:07:36 +0300
Message-ID: <20180828110736.zqiirsjn6jmwqurk@valkosipuli.retiisi.org.uk>
References: <20180828015252.28511-1-robh@kernel.org>
 <20180828015252.28511-25-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180828015252.28511-25-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Mon, Aug 27, 2018 at 08:52:26PM -0500, Rob Herring wrote:
> In preparation to remove the node name pointer from struct device_node,
> convert printf users to use the %pOFn format specifier.
> 
> Cc: Sakari Ailus <sakari.ailus@iki.fi>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: linux-leds@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
e-mail: sakari.ailus@iki.fi
