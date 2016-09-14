From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH -next] leds: mlxcpld: fix return value check in
 mlxcpld_led_init()
Date: Wed, 14 Sep 2016 08:55:30 +0200
Message-ID: <e5b6b992-4881-3e7d-5904-a7d690c9e66d@samsung.com>
References: <CGME20160913145849eucas1p1c1661ef621a39d2955b29710a3729e7b@eucas1p1.samsung.com>
 <1473778715-11283-1-git-send-email-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:8768 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751091AbcINGzg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 14 Sep 2016 02:55:36 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0ODH00LDYF8K9080@mailout3.w1.samsung.com> for
 linux-leds@vger.kernel.org; Wed, 14 Sep 2016 07:55:32 +0100 (BST)
In-reply-to: <1473778715-11283-1-git-send-email-weiyj.lk@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Wei Yongjun <weiyj.lk@gmail.com>, Vadim Pasternak <vadimp@mellanox.com>, Richard Purdie <rpurdie@rpsys.net>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-leds@vger.kernel.org

Hi Wei,

On 09/13/2016 04:58 PM, Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
>
> In case of error, the function platform_device_register_simple() returns
> ERR_PTR() and never returns NULL. The NULL test in the return value
> check should be replaced with IS_ERR().
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/leds/leds-mlxcpld.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/leds/leds-mlxcpld.c b/drivers/leds/leds-mlxcpld.c
> index 125ddfa..2ba76c1 100644
> --- a/drivers/leds/leds-mlxcpld.c
> +++ b/drivers/leds/leds-mlxcpld.c
> @@ -401,9 +401,9 @@ static int __init mlxcpld_led_init(void)
>  	int err;
>
>  	pdev = platform_device_register_simple(KBUILD_MODNAME, -1, NULL, 0);
> -	if (!pdev) {
> +	if (IS_ERR(pdev)) {
>  		pr_err("Device allocation failed\n");
> -		return -ENOMEM;
> +		return PTR_ERR(pdev);
>  	}
>
>  	err = platform_driver_probe(&mlxcpld_led_driver, mlxcpld_led_probe);
>
>
>
>

Thanks for your patches. Would you mind if I merged them to the
original patch and added your Reviewed-by tag to the commit message?

-- 
Best regards,
Jacek Anaszewski
