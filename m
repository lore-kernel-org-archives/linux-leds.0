From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH][next] leds: TI LMU: remove redundant u8 comparisons with
 less than zero
Date: Wed, 22 May 2019 12:53:17 +0300
Message-ID: <20190522095317.GT31203@kadam>
References: <20190522082627.18354-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190522082627.18354-1-colin.king@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin King <colin.king@canonical.com>
Cc: Dan Murphy <dmurphy@ti.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

No.  This isn't the right fix.  We should declare them as int instead.

regards,
dan carpenter
