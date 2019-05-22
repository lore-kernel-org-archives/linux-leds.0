From: Colin Ian King <colin.king@canonical.com>
Subject: Re: [PATCH][next] leds: TI LMU: remove redundant u8 comparisons with
 less than zero
Date: Wed, 22 May 2019 11:00:04 +0100
Message-ID: <dcb1f2d8-5894-ee7a-6413-ad6f596da888@canonical.com>
References: <20190522082627.18354-1-colin.king@canonical.com>
 <20190522095317.GT31203@kadam>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190522095317.GT31203@kadam>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dan Murphy <dmurphy@ti.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 22/05/2019 10:53, Dan Carpenter wrote:
> No.  This isn't the right fix.  We should declare them as int instead.

Doh, brown paper bag time. I'll do a V2.

> 
> regards,
> dan carpenter
> 
