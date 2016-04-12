From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 1/2] mtd: Uninline mtd_write_oob and move it to
 mtdcore.c
Date: Tue, 12 Apr 2016 20:15:24 +0200
Message-ID: <20160412201524.1549b844@bbrezillon>
References: <1460478395-25925-1-git-send-email-ezequiel@vanguardiasur.com.ar>
	<1460478395-25925-2-git-send-email-ezequiel@vanguardiasur.com.ar>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:45651 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1756171AbcDLSP1 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 12 Apr 2016 14:15:27 -0400
In-Reply-To: <1460478395-25925-2-git-send-email-ezequiel@vanguardiasur.com.ar>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: linux-mtd@lists.infradead.org, linux-leds@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>

On Tue, 12 Apr 2016 13:26:34 -0300
Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:

> There's no reason for having mtd_write_oob inlined in mtd.h header.
> Move it to mtdcore.c where it belongs.

I guess the real motivation here is to avoid including leds.h in
mtd.h :).

> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/mtd/mtdcore.c   | 12 ++++++++++++
>  include/linux/mtd/mtd.h | 12 +-----------
>  2 files changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 309625130b21..99d83f3331b0 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -997,6 +997,18 @@ int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
>  }
>  EXPORT_SYMBOL_GPL(mtd_read_oob);
>  
> +int mtd_write_oob(struct mtd_info *mtd, loff_t to,
> +				struct mtd_oob_ops *ops)
> +{
> +	ops->retlen = ops->oobretlen = 0;
> +	if (!mtd->_write_oob)
> +		return -EOPNOTSUPP;
> +	if (!(mtd->flags & MTD_WRITEABLE))
> +		return -EROFS;
> +	return mtd->_write_oob(mtd, to, ops);
> +}
> +EXPORT_SYMBOL_GPL(mtd_write_oob);
> +
>  /*
>   * Method to access the protection register area, present in some flash
>   * devices. The user data is one time programmable but the factory data is read
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 771272187316..ef9fea4fc400 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -283,17 +283,7 @@ int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
>  		    const u_char *buf);
>  
>  int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops);
> -
> -static inline int mtd_write_oob(struct mtd_info *mtd, loff_t to,
> -				struct mtd_oob_ops *ops)
> -{
> -	ops->retlen = ops->oobretlen = 0;
> -	if (!mtd->_write_oob)
> -		return -EOPNOTSUPP;
> -	if (!(mtd->flags & MTD_WRITEABLE))
> -		return -EROFS;
> -	return mtd->_write_oob(mtd, to, ops);
> -}
> +int mtd_write_oob(struct mtd_info *mtd, loff_t to, struct mtd_oob_ops *ops);
>  
>  int mtd_get_fact_prot_info(struct mtd_info *mtd, size_t len, size_t *retlen,
>  			   struct otp_info *buf);



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
