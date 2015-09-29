From: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: Re: [PATCH 2/3] leds: add debugfs to device trigger
Date: Tue, 29 Sep 2015 09:04:25 +0200
Message-ID: <20150929070425.GA2896@corsair.lan>
References: <ca802c20eb972c459bb8671ba203a5f0b2b2770d.1443472356.git.maciek.borzecki@gmail.com>
 <201509291106.01PhMygT%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201509291106.01PhMygT%fengguang.wu@intel.com>
Sender: linux-doc-owner@vger.kernel.org
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, linux-kernel@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
List-Id: linux-leds@vger.kernel.org

On 09/29 11:41, kbuild test robot wrote:
> Hi Maciek,
>
> [auto build test results on v4.3-rc3 -- if it's inappropriate base, please ignore]
>
> reproduce:
>   # apt-get install sparse
>   make ARCH=x86_64 allmodconfig
>   make C=1 CF=-D__CHECK_ENDIAN__
>
>
> sparse warnings: (new ones prefixed by >>)
>
> >> drivers/leds/trigger/ledtrig-device.c:214:22: sparse: incorrect type in argument 1 (different address spaces)
>    drivers/leds/trigger/ledtrig-device.c:214:22:    expected char const *<noident>
>    drivers/leds/trigger/ledtrig-device.c:214:22:    got char const [noderef] <asn:1>*buf

Right, noted right after sending the patch. Will fix in v2.

>
> vim +214 drivers/leds/trigger/ledtrig-device.c
>
>    198		.read = seq_read,
>    199		.llseek = seq_lseek,
>    200		.release = single_release
>    201	};
>    202
>    203	static int get_dev_from_user(const char __user *buf, size_t size,
>    204				dev_t *dev)
>    205	{
>    206		unsigned int major;
>    207		unsigned int minor;
>    208		int ret;
>    209
>    210		WARN_ON(dev == NULL);
>    211		if (dev == NULL)
>    212			return -EINVAL;
>    213
>  > 214		ret = sscanf(buf, "%u:%u", &major, &minor);
>    215		if (ret < 2)
>    216			return -EINVAL;
>    217
>    218		*dev = MKDEV(major, minor);
>    219		return 0;
>    220	}
>    221
>    222	static ssize_t ledtrig_dev_register_write(struct file *filp,
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--
Maciek Borzecki
