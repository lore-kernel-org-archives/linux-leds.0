From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 3/5] leds: max77693: Remove work queue
Date: Tue, 22 Sep 2015 13:28:16 +0300
Message-ID: <56012D40.3060408@linux.intel.com>
References: <1442845770-17800-1-git-send-email-j.anaszewski@samsung.com>
 <1442845770-17800-4-git-send-email-j.anaszewski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1442845770-17800-4-git-send-email-j.anaszewski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, andrew@lunn.ch
List-Id: linux-leds@vger.kernel.org

Jacek Anaszewski wrote:
> Now the core implements the work queue, remove it from the drivers,
> and switch to using brightness_set_blocking op.
> 
> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>

Nice patches! For patches 3--5:

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
sakari.ailus@linux.intel.com
