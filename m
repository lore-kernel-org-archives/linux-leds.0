Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1431335C181;
	Fri, 25 Sep 2026 06:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790316738; cv=none; b=qUCL6mZeWYhGTKGrQEgmyBAYov56t5iAupHmug6pRO8gQt65XYE8rCeTq0ypJm76RfYX1jT2Cxlc3V84Y280K0JUWfAb4xVbsWYKgUQ/+Z5RHsxp2TdeIV69MuwE337AU0MeNFlKQzlceNSkCMXL+qlAgvu4J7SrhPyczo+BIRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790316738; c=relaxed/simple;
	bh=P2P1AmfxEYO+zzlHQdbgxVmc0L7aQerHsV5uj3L90EU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y/KWMA9qoqCp1dMQJzrZzxsmnWVxTDqXCV2H2euwSZvZMIyHgJiLlLXaHuFQEyhAtvN05ls8e4Sgr48NgBtOZhw7nahkBP7V4l2LVh41BEWLER4rllSdfKnnNQqbI4VrKHll2znDaDaKErWrfI6RgBq3VGVC13CJFouf5TtkBIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OKLZKZlh; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OKLZKZlh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790316735; x=1821852735;
  h=date:from:to:cc:subject:message-id;
  bh=P2P1AmfxEYO+zzlHQdbgxVmc0L7aQerHsV5uj3L90EU=;
  b=OKLZKZlhVuBOPe8r5f9cK6GaOfNMiUqg9PzqLpqqAMZ9c3cz88FaVq55
   8/ESSnU4LTjRuqrO1j39cUUQ49NhhN72OvBKVXKMQmpW0QDWDvm5A2e5w
   lN6Jl+DP+siyuLXIP3er56Cj1o5SyIdaQrY5QCdLmv723JJ4dTCFalWCN
   QkxYRU+LJPso/yVNLQJd7Zw96t5xrM5eaBfJ5vlX3+4PeusfxrEzfjCqr
   XixWEJH3Trvb/jXxTBWpZ+vvdlH/ONGHyUxkkapgaeM67kF/VG2HVw+p/
   KGtaKbx4qOv5fF2K+2J3PeWhMN00x9yffC4HMC8uHZ8hDjdK2epXfdQ3X
   A==;
X-CSE-ConnectionGUID: HYAzf+qmRTmJ21S6YjIQEw==
X-CSE-MsgGUID: 0IJHJoXRQVClPSNj2mAX/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90057985"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="90057985"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 23:12:15 -0700
X-CSE-ConnectionGUID: oaf+N8YjSEWjgyGuxxKOXA==
X-CSE-MsgGUID: uDv87LGbRwm4AGoJ9UoICQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="273796557"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 24 Sep 2026 23:12:13 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9zAI-000000000c6-0kyr;
	Fri, 25 Sep 2026 06:12:10 +0000
Date: Fri, 25 Sep 2026 08:11:39 +0200
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-leds@vger.kernel.org,
 Lee Jones <lee@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>,
 linux-doc@vger.kernel.org
Subject: [lee-leds:for-leds-next 30/40] htmldocs: Warning:
 Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file
 that doesn't exist: Documentation/devicetree/bindings/leds/leds-cpcap.txt
Message-ID: <202609250840.ZZRuCtU9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
head:   05b4738b0078f7d6f154f68068a11c8a0635e9df
commit: d4948551280b1d52c1896b7c80d5383b7d8ad7c5 [30/40] dt-bindings: leds: leds-cpcap: Convert to DT schema
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260925/202609250840.ZZRuCtU9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609250840.ZZRuCtU9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/translations/pt_BR/process/security-bugs.rst: :doc:`regular path submission </../../../process/submitting-patches>`
>> Warning: Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
   Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
   Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
>> Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/leds/leds-cpcap.txt
   Warning: Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/rtc/motorola,cpcap-rtc.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
   Warning: Documentation/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/it_IT/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
