From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [j.anaszewski-leds:for-next 3/14]
 drivers/leds/leds-ti-lmu-common.c:97 ti_lmu_common_set_ramp() warn:
 impossible condition '(ramp_up < 0) => (0-255 < 0)'
Date: Wed, 22 May 2019 09:47:35 +0300
Message-ID: <20190522064735.GK19380@kadam>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kbuild-bounces@lists.01.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.01.org/mailman/options/kbuild>,
 <mailto:kbuild-request@lists.01.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/kbuild/>
List-Post: <mailto:kbuild@lists.01.org>
List-Help: <mailto:kbuild-request@lists.01.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/kbuild>,
 <mailto:kbuild-request@lists.01.org?subject=subscribe>
Errors-To: kbuild-bounces@lists.01.org
Sender: "kbuild" <kbuild-bounces@lists.01.org>
To: kbuild@01.org, Dan Murphy <dmurphy@ti.com>
Cc: kbuild-all@01.org, linux-leds@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>
List-Id: linux-leds@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git for-next
head:   413874ce52afa3310433e6dd73d775fd05bf92e7
commit: 9a8e66ebeaa20a4f3eba12f0eba6835e8db16ded [3/14] leds: TI LMU: Add common code for TI LMU devices

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/leds/leds-ti-lmu-common.c:97 ti_lmu_common_set_ramp() warn: impossible condition '(ramp_up < 0) => (0-255 < 0)'
drivers/leds/leds-ti-lmu-common.c:97 ti_lmu_common_set_ramp() warn: impossible condition '(ramp_down < 0) => (0-255 < 0)'

# https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git/commit/?id=9a8e66ebeaa20a4f3eba12f0eba6835e8db16ded
git remote add j.anaszewski-leds https://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git
git remote update j.anaszewski-leds
git checkout 9a8e66ebeaa20a4f3eba12f0eba6835e8db16ded
vim +97 drivers/leds/leds-ti-lmu-common.c

9a8e66eb Dan Murphy 2019-05-06   83  
9a8e66eb Dan Murphy 2019-05-06   84  int ti_lmu_common_set_ramp(struct ti_lmu_bank *lmu_bank)
9a8e66eb Dan Murphy 2019-05-06   85  {
9a8e66eb Dan Murphy 2019-05-06   86  	struct regmap *regmap = lmu_bank->regmap;
9a8e66eb Dan Murphy 2019-05-06   87  	u8 ramp, ramp_up, ramp_down;
9a8e66eb Dan Murphy 2019-05-06   88  
9a8e66eb Dan Murphy 2019-05-06   89  	if (lmu_bank->ramp_up_usec == 0 && lmu_bank->ramp_down_usec == 0) {
9a8e66eb Dan Murphy 2019-05-06   90  		ramp_up = 0;
9a8e66eb Dan Murphy 2019-05-06   91  		ramp_down = 0;
9a8e66eb Dan Murphy 2019-05-06   92  	} else {
9a8e66eb Dan Murphy 2019-05-06   93  		ramp_up = ti_lmu_common_convert_ramp_to_index(lmu_bank->ramp_up_usec);
9a8e66eb Dan Murphy 2019-05-06   94  		ramp_down = ti_lmu_common_convert_ramp_to_index(lmu_bank->ramp_down_usec);
9a8e66eb Dan Murphy 2019-05-06   95  	}
9a8e66eb Dan Murphy 2019-05-06   96  
9a8e66eb Dan Murphy 2019-05-06  @97  	if (ramp_up < 0 || ramp_down < 0)
                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Utterly unpossible!

9a8e66eb Dan Murphy 2019-05-06   98  		return -EINVAL;
9a8e66eb Dan Murphy 2019-05-06   99  
9a8e66eb Dan Murphy 2019-05-06  100  	ramp = (ramp_up << 4) | ramp_down;
9a8e66eb Dan Murphy 2019-05-06  101  
9a8e66eb Dan Murphy 2019-05-06  102  	return regmap_write(regmap, lmu_bank->runtime_ramp_reg, ramp);
9a8e66eb Dan Murphy 2019-05-06  103  
